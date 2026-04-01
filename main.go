package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func setupRouter() *gin.Engine {
	r := gin.Default()
	r.POST("/", func(c *gin.Context) {
		c.String(http.StatusOK, "ok")
	})
	return r
}

func main() {
	r := setupRouter()
	r.Run()
}
