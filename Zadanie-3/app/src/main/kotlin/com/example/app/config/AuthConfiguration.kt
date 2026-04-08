package com.example.app.config

import com.example.app.service.AuthService
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Lazy

@Configuration
class AuthConfiguration {
    @Bean
    fun eagerAuthService(): AuthService {
        println("Inicjalizacja AuthService - eager")
        return AuthService("Eager")
    }

    @Bean
    @Lazy
    fun lazyAuthService(): AuthService {
        println("Inicjalizacja AuthService - lazy")
        return AuthService("Lazy")
    }
}