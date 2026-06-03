fun main() {
    println(saludoClinica())
    println(registrarPaciente("Luna"))
    println(calcularCostoConsulta(urgente = true))
}

fun saludoClinica(): String {
    return "Bienvenido a la Clínica Veterinaria MP"
}

fun registrarPaciente(nombre: String): String {
    return "Paciente registrado: $nombre"
}

fun calcularCostoConsulta(urgente: Boolean): Double {
    return if (urgente) 50.0 else 35.0
}