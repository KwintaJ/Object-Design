package controller

import (
    "net/http"
    "kwintaj.com/drizzle/proxy"
    "github.com/labstack/echo/v4"
)

func GetWeather(c echo.Context) error {
    data, err := proxy.GetData(c.QueryParam("city"))

    if err != nil {
        return c.JSON(http.StatusBadGateway, map[string]string{"error": "Nie udało się pobrać danych"})
    }
    
    return c.JSON(http.StatusOK, data)
}
