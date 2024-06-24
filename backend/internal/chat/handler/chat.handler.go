package chat

import (
	"chat/db"
	chat "chat/internal/chat/service"
	"chat/internal/interfaces"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"xorm.io/xorm"
)

// @Summary Create New User
// @Description Create New User
// @Tags User
// @Accept json
// @Produce json
// @Param request body interfaces.User true "Data for create new User"
// @Param Authorization header string true "Auth Token" default(Bearer <token>)
// @Success 200 {object} db.User "List of All User"
// @Router /api/user [post]
func CreateUser(c *gin.Context) {
	var userInput interfaces.User

	if err := c.ShouldBindJSON(&userInput); err != nil {
		c.Set("Error", "Parameters are invalid, need a JSON")
		c.Status(http.StatusInternalServerError)
		return
	}

	if err := chat.CreateUserService(c, userInput); err != nil {
		c.Set("Error", err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", "User created successfully")
	c.Status(http.StatusOK)

}

// @Summary Found All Questions
// @Description Found All Questions
// @Tags Questions
// @Accept json
// @Produce json
// @Param Authorization header string true "Auth Token" default(Bearer <token>)
// @Success 200 {object} interfaces.SwaggerQuestion "List of All User"
// @Router /api/questions [get]
func FoundAllQuestions(c *gin.Context) {
	res := chat.GetQuestions()
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

// @Summary Create marks questions
// @Description Create marks questions
// @Tags Questions
// @Accept json
// @Produce json
// @Param request body interfaces.SwaggerResponses true "Data for marks questions :)"
// @Param Authorization header string true "Auth Token" default(Bearer <token>)
// @Success 200 {object} string "List of All Questions"
// @Router /api/questions [post]
func SendAllMarkQuestions(c *gin.Context) {
	var userInput interfaces.SwaggerResponses

	if err := c.ShouldBindJSON(&userInput); err != nil {
		c.Set("Error", "Parameters are invalid, need a JSON")
		c.Status(http.StatusInternalServerError)
		return
	}

	risk, err := chat.MakeRisk(userInput.Responses)
	if err != nil {
		c.Set("Error", err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}

	// Atualizar o risco do usuário no banco de dados
	engine, exists := c.Get("db")
	if !exists {
		c.Set("Error", "Database connection not found")
		c.Status(http.StatusInternalServerError)
		return
	}

	user := &db.User{
		ID:   userInput.UserId,
		Risk: risk,
	}

	if err := db.Update(engine.(*xorm.Engine), user, user.ID); err != nil {
		c.Set("Error", err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}

	c.Set("Response", gin.H{"message": "Risk calculated and updated successfully", "risk": risk})
	c.Status(http.StatusOK)
}

// @Summary Retrieve All User
// @Description Retrieve all User
// @Tags User
// @Accept json
// @Produce json
// @Param Authorization header string true "Auth Token" default(Bearer <token>)
// @Success 200 {object} db.User "List of All User"
// @Router /api/all-user [get]
func PullAllUser(c *gin.Context) {
	chat.PullAllUserServices(c)
}

// @Summary Retrieve User by ID
// @Description Retrieve an User by its ID
// @Tags User
// @Accept json
// @Produce json
// @Param id path int true "User ID"
// @Param Authorization header string true "Auth Token" default(Bearer <token>)
// @Success 200 {object} db.User "User Details"
// @Router /api/user/{id} [get]
func PullUserId(c *gin.Context) {
	idParam := c.Param("id")
	id, err := strconv.Atoi(idParam)
	if err != nil {
		c.Set("Error", "Invalid asset ID")
		c.Status(http.StatusBadRequest)
		return
	}
	chat.PullUserServicesId(c, id)
}
