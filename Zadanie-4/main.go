package main

import (
    "kwintaj.com/drizzle/controller"
    "kwintaj.com/drizzle/model"
    "kwintaj.com/drizzle/proxy"
    "github.com/labstack/echo/v4"
    "gorm.io/driver/sqlite"
    "gorm.io/gorm"
)

func main() {
    e := echo.New()

    db, _ := gorm.Open(sqlite.Open("weather.db"), &gorm.Config{})
    db.AutoMigrate(&model.Weather{})
    
    weatherProxy := proxy.NewWeatherProxy(db)
    weatherCtrl := &controller.WeatherController{
        Proxy: weatherProxy,
    }

    e.GET("/in", weatherCtrl.GetWeather)

    e.Logger.Fatal(e.Start(":8080"))
}
