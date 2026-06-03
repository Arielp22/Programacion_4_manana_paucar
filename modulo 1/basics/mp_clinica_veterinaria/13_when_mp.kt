fun main() {
    println("Controles de flujo when")
    println("Escriba código:")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val especialidad = when (codigo) {
        1 -> "Cirugía Veterinaria"
        2 -> "Fisioterapia Animal"
        3 -> "Odontología Veterinaria"
        4 -> "Nutrición Animal"
        5 -> "Cardiología Veterinaria"
        6 -> "Dermatología Veterinaria"
        else -> "Especialidad no registrada en el sistema"
    }

    println("Especialidad: $especialidad")
}