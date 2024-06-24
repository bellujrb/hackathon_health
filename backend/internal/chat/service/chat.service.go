package chat

import (
	"chat/db"
	"chat/internal/interfaces"
	"errors"
	"net/http"

	"github.com/gin-gonic/gin"
	"xorm.io/xorm"
)

func CreateUserService(c *gin.Context, data interfaces.User) error {
	engine, exists := c.Get("db")
	if !exists {
		return errors.New("database connection not found")
	}

	MentalInput := db.User{
		Name:  data.Name,
		Email: data.Email,
		Risk:  data.Risk,
	}

	errChan := make(chan error, 1)

	go func() {
		err := db.Create(engine.(*xorm.Engine), &MentalInput)
		errChan <- err
	}()

	if err := <-errChan; err != nil {
		return err
	}

	return nil
}

func PullAllUserServices(c *gin.Context) {
	var User []db.User
	engine, exists := c.Get("db")
	if !exists {
		c.Set("Error", "Database connection not found")
		c.Status(http.StatusInternalServerError)
		return
	}

	if err := db.GetAll(engine.(*xorm.Engine), &User); err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", User)
	c.Status(http.StatusOK)
}

func PullUserServicesId(c *gin.Context, id int) {
	var User db.User
	engine, exists := c.Get("db")
	if !exists {
		c.Set("Error", "Database connection not found")
		c.Status(http.StatusInternalServerError)
		return
	}

	found, err := db.GetByID(engine.(*xorm.Engine), &User, int64(id))
	if err != nil {
		c.Set("Error", "Error retrieving User")
		c.Status(http.StatusInternalServerError)
		return
	}
	if !found {
		c.Set("Error", "User not found")
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", User)
	c.Status(http.StatusOK)
}
