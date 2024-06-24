package main

import (
	"chat/db"
	"chat/internal/pdf"
	"chat/middleware"
	"log"
)

// @title           Chat
// @version         1.0
// @description     This is a server for app.

// @host      localhost:8080
//trade this for localhost:8080 or aws domain

// @securityDefinitions.basic  BasicAuth

// @externalDocs.description  OpenAPI
// @externalDocs.url          https://swagger.io/resources/open-api/

func main() {
	pdf.SetLicense()

	r := middleware.SetupRouter()

	db.ConnectDatabase()
	if err := db.Migrate(db.Repo); err != nil {
		log.Fatal("Failed to migrate database: ", err)
	}
	r.Run(":8080")
}
