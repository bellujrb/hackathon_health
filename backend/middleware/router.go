package middleware

import (
	"chat/db"
	_ "chat/docs"

	chat "chat/internal/chat/handler"
	"chat/internal/pdf"

	"github.com/gin-gonic/gin"
	swaggerfiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

// @title Chat Hackaton
// @version 1.0
// @description API
// @termsOfService http://swagger.io/terms/
// @host localhost:8080
// @BasePath /api
func SetupRouter() *gin.Engine {
	r := gin.Default()

	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerfiles.Handler))

	r.Use(CORSConfig())
	r.Use(ResponseHandler())

	r.Use(func(c *gin.Context) {
		c.Set("db", db.Repo)
		c.Next()
	})

	//Use response, but not Token
	r.GET("/token", generateTokenHandler)

	auth := r.Group("/api")
	auth.Use(authMiddleware)

	//Response and token service

	auth.POST("/upload", pdf.UploadHandler)

	auth.POST("/user", chat.CreateUser)
	auth.GET("/all-user", chat.PullAllUser)
	auth.GET("/user/:id", chat.PullUserId)

	auth.GET("/questions", chat.FoundAllQuestions)
	auth.POST("/questions", chat.SendAllMarkQuestions)
	return r
}
