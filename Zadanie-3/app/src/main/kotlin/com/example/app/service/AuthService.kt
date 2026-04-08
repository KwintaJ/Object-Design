package com.example.app.service

class AuthService(private val type: String) {
    // mock baza haseł
    private val credentials = mapOf(
        "admin1" to "4321",
        "jankowalski" to "aaaa1111",
        "aeuiskge891" to "1234"
    )

    fun authenticate(user: String, pass: String): Boolean {
        println("Próba logowania dla użytkownika: $user")
        val validPassword = credentials[user]
        return validPassword != null && validPassword == pass
    }
}
