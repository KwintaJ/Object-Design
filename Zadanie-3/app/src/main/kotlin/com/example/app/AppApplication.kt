package com.example.app

import com.example.app.service.AuthService
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.beans.factory.annotation.Autowired;
import jakarta.annotation.PostConstruct

@SpringBootApplication
class AppApplication @Autowired constructor( @Qualifier("eagerAuthService") private val authService: AuthService ) {
    @PostConstruct
    fun init() {
        println("Serwis wstrzyknięty do klasy głównej")

        val result = authService.authenticate("admin1", "4321")
        println("Test autoryzacji admina: $result ")
    }
}

fun main(args: Array<String>) {
	runApplication<AppApplication>(*args)
}
