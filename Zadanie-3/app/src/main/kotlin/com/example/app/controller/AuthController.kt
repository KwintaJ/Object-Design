package com.example.app.controller

import com.example.app.model.UserResponse
import com.example.app.model.LoginRequest
import com.example.app.service.AuthService
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.context.annotation.Lazy
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/auth")
class AuthController(
    @Lazy
    @Qualifier("lazyAuthService") private val authService: AuthService 
) {
    private val users = listOf(
        UserResponse(1, "admin1", "ADMIN"),
        UserResponse(2, "jankowalski", "USER"),
        UserResponse(3, "aeuiskge891", "USER")
    )

    @GetMapping("/users")
    fun getUsers(): List<UserResponse> {
        return users
    }

    @PostMapping("/login")
    fun login(@RequestBody request: LoginRequest): String {
        val isAuthenticated = authService.authenticate(request.username, request.password)
        
        return if (isAuthenticated) {
            "Zalogowano pomyślnie ${request.username}."
        } else {
            "Niepoprawny login lub hasło."
        }
    }
}