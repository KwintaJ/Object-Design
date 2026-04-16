package model

import (
    "time"
    "gorm.io/gorm"
)

type Weather struct {
    gorm.Model
    City            string
    Conditions      string
    TemperatureMax  int
    TemperatureMin  int
    Day             time.Time
}
