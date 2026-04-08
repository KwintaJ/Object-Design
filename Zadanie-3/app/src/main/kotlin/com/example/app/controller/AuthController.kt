package com.example.app.controller

import com.example.app.model.UserResponse
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/auth")
class AuthController {
    private val users = listOf(
        UserResponse(1, "admin1", "ADMIN"),
        UserResponse(2, "jankowalski", "USER"),
        UserResponse(3, "aeuiskge891", "USER")
    )

    @GetMapping("/users")
    fun getUsers(): List<UserResponse> {
        return users
    }
}