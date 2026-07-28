class Cita(val mascota: String, val motivo: String, val hora: String) {
    constructor(mascota: String) : this(mascota, "control general", "09:00")

    constructor(mascota: String, hora: Int) : this(
        mascota,
        "consulta",
        "${"%02d".format(hora)}:00"
    )

    override fun toString(): String = "$mascota - $motivo - $hora"
}

fun main() {
    val cita1 = Cita("Luna")
    val cita2 = Cita("Roco", 11)
    val cita3 = Cita("Milo", "vacunacion", "14:30")

    println(cita1)
    println(cita2)
    println(cita3)
}