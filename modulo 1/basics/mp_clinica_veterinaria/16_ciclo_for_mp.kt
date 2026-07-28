fun main() {
    println("Controles de flujo iteraciones, Ciclos repetitivos - ciclo for")

    println("for con rango")
    for (i in 1..5) {
        println(i)
    }

    println("for con until")
    for (i in 0 until 5) {
        println(i)
    }

    println("For con pasos")
    for (i in 1..10 step 3) {
        println(i)
    }

    println("For descendente")
    for (i in 10 downTo 1) {
        println(i)
    }

    println("For con listas")
    val nombres = listOf("Luna", "Roco", "Milo")
    for (nombre in nombres) {
        println(nombre)
    }

    println("For con listas index valor")
    for ((index, valor) in nombres.withIndex()) {
        println("$index -> $valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
        println(i)
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) continue
        println("item $i")
    }

    val pacientes = listOf(
        Triple("Luna", 39.2, 98),
        Triple("Roco", 37.1, 94),
        Triple("Milo", 40.3, 91)
    )

    for ((posicion, paciente) in pacientes.withIndex()) {
        val (nombre, temperatura, spo2) = paciente

        val alertaTemp = if (temperatura > 39.0) "Fiebre" else "Normal"
        val alertaSpo2 = if (spo2 < 95) "Baja" else "Normal"

        println("Cama $posicion = $nombre = Temp: $temperatura °C ($alertaTemp) = SpO2: $spo2 ($alertaSpo2)")
    }
}