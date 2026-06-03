fun main() {
    val mascota = "Luna"
    val duenio = "Sandra"
    val especie = "gato"
    val edad = 3

    println("Paciente: $mascota")

    println("Dueño completo: ${duenio.uppercase()} ${especie.uppercase()}")
    println("Edad en meses: ${edad * 12}")

    val fichaCompleta = "Dueño completo: ${duenio.uppercase()} ${especie.uppercase()}"
    println(fichaCompleta)

    val ficha = """
        |Ficha clínica
        |Mascota: $mascota
        |Dueño: $duenio
        |Especie: $especie
        |Estado: ${if (edad > 1) "Atendido" else "En observación"}
        |Mascota: $mascota
    """.trimMargin()

    print(ficha)
}