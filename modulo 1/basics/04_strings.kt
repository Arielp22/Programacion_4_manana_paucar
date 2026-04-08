fun main() {

    val nombre = "Juan"
    val apellido = "Paez"
    val edad = 28

    // var simple
    println("Hola $nombre")

    // expresión
    println("Nombre completo: ${nombre.uppercase()} ${apellido.uppercase()}")
    println("Edad: ${edad + 6} años")

    val nombreCompleto = "Nombre completo: ${nombre.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)

    // string multilinea
    val tarjeta = """
        |Nombre: $nombre $apellido
        |Edad: $edad
        |Acceso: ${if (edad > 18) "Permitido" else "Denegado"}
        |Nombre: $nombre $apellido
    """.trimMargin()

    print(tarjeta)
}
   