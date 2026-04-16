package model

import "gorm.io/gorm"

type Weather struct {
    gorm.Model
    City string
    Conditions string
    TemperatureMax int
    TemperatureMin int
}
