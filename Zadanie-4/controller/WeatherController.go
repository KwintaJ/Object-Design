package controller

import (
    "net/http"
    "kwintaj.com/drizzle/model"
    "github.com/labstack/echo/v4"
)

func GetWeather(c echo.Context) error {
    data := model.Weather{City:"Warszawa", Conditions:"Rain", Temperature:13}
    return c.JSON(http.StatusOK, data)
}
