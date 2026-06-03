fun main() {
    println(crearCita("Luna", "09:30", "vacunación", true))
    println(crearCita(nombre = "Roco"))
    println(crearCita(nombre = "Milo", hora = "11:00", confirmar = false))
}

fun crearCita(
    nombre: String,
    hora: String = "10:00",
    tipo: String = "consulta",
    confirmar: Boolean = true
): String {
    return "Cita[$nombre, hora=$hora, tipo=$tipo, confirmar=$confirmar]"
}