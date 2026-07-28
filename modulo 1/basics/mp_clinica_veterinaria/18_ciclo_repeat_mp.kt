fun main() {

    println("Controles de flujo - While")

    var pacientesEnEspera = 1
    while (pacientesEnEspera <= 5) {
        println(pacientesEnEspera)
        pacientesEnEspera++
    }

    println("\nDo While")
    pacientesEnEspera = 1

    do {
        println(pacientesEnEspera)
        pacientesEnEspera++
    } while (pacientesEnEspera <= 5)

    println("\nBreak y Continue")
    var codigoMascota = 0

    while (codigoMascota < 10) {
        codigoMascota++

        if (codigoMascota == 3) continue
        if (codigoMascota == 7) break

        println(codigoMascota)
    }

    while (true) {

        println("\n===== MENÚ VETERINARIA =====")
        println("registrar")
        println("cobrar")
        println("dosis")
        println("salir")
        print("Opción: ")

        val input = readLine()?.trim() ?: "salir"

        when (input.lowercase()) {

            "registrar" -> {
                println("Mascota registrada exitosamente.")
            }

            "cobrar" -> {
                print("Ingrese el costo de la consulta: ")
                val a = readLine()?.toIntOrNull() ?: 0

                print("Ingrese el costo de la medicina: ")
                val b = readLine()?.toIntOrNull() ?: 0

                println("Resultado: ${a + b}")
            }

            "dosis" -> {
                var c = 1
                while (c <= 10) {
                    println("Peso: $c kg -> Dosis: ${5 * c} ml")
                    c++
                }
            }

            "salir" -> {
                println("Programa finalizado.")
                break
            }

            else -> {
                println("Opción no válida.")
            }
        }
    }
}