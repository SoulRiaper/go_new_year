package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	s := echo.New()
	s.GET("/", Handler)
	s.Logger.Fatal(s.Start(":8080"))
}

func Handler(c echo.Context) error {
	return c.String(http.StatusOK, "Zdarova")
}
