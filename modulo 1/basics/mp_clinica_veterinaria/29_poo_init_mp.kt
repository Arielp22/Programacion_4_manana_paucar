class Paciente(val nombre: String, val emailDueno: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        require(nombre.isNotBlank()) { "El nombre de la mascota no puede estar vacio" }
        require(emailDueno.contains("@")) { "Email invalido: $emailDueno" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail = emailDueno.substringAfter("@")
    }
}

fun main() {
    val p = Paciente("  Luna  ", "dueno@veterinaria.com")
    println(p.nombreNormalizado)  
    println(p.dominioEmail)       
}