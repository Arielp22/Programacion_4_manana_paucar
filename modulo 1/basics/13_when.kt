fun main() {
    println("Controles de flujo when")
    println("Escriba código:")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val especialidad = when (codigo) {
        1 -> "Medicina General"
        2 -> "Pediatría"
        3 -> "Cardiología"
        4 -> "Ginecología"
        5 -> "Neurología"
        6 -> "Dermatología"
        else -> "Especialidad no registrada en el sistema"
    }

    println("Especialidad: $especialidad")
}
