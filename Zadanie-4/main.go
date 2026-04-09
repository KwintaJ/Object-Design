package main

import (
    "kwintaj.com/drizzle/controller"
  //"kwintaj.com/drizzle/model"
    "github.com/labstack/echo/v4"
)

func main() {
    e := echo.New()
    
    e.GET("/in", controller.GetWeather)

    e.Logger.Fatal(e.Start(":8080"))
}
