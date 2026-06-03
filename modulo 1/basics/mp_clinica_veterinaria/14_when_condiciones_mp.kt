fun main() {
    println("Controles de Flujo When - condiciones arbitrarias")

    println("Escriba codigo:")
    val codigo = readLine()

    println("Edad de la mascota:")
    val edadPaciente = readLine()?.toIntOrNull() ?: 0

    println("Tiene seguro médico (s/n):")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"

    val nivelSeguro = if (tieneSeguro) {
        println("Nivel del seguro (BASICO/INTERMEDIO/PREMIUM):")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    val copago = when {
        !tieneSeguro && edadPaciente < 1 -> 0.0
        !tieneSeguro && edadPaciente >= 10 -> 15.0
        !tieneSeguro -> 45.0
        nivelSeguro == "BASICO" -> 20.0
        nivelSeguro == "INTERMEDIO" -> 10.0
        nivelSeguro == "PREMIUM" -> 0.0
        else -> 30.0
    }

    println("Copago: $" + "%.2f".format(copago))
}