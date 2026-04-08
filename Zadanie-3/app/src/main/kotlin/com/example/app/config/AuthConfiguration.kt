package com.example.app.config

import com.example.app.service.AuthService
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class AuthConfiguration {
    @Bean
    fun eagerAuthService(): AuthService {
        println("Inicjalizacja AuthService - eager")
        return AuthService("Eager")
    }
}