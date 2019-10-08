package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.GET("/healthz", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Rlx to vivao carai",
		})
	})

	r.GET("/readiness", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Bati a nave nao doido",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
