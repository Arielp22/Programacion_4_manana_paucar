open class PersonalVeterinario(val nombre: String, val cargo: String) {

    open fun realizarAccion() {
        println("$nombre esta cumpliendo sus labores de $cargo")
    }

    open fun obtenerPerfil(): String {
        return "Empleado: $nombre"
    }

    fun registrarAsistencia() {
        println("$nombre ha registrado su entrada")
    }
}

class Veterinario(nombre: String) : PersonalVeterinario(nombre, "Veterinario Clinico") {

    override fun realizarAccion() {
        super.realizarAccion()
        println("(Procede a atender al paciente en el consultorio)")
    }

    override fun obtenerPerfil(): String {
        return "${super.obtenerPerfil()}, Medico Cirujano"
    }
}

class Recepcionista(nombre: String, val turnoManana: Boolean) : PersonalVeterinario(nombre, "Recepcionista") {

    override fun obtenerPerfil(): String {
        return "${super.obtenerPerfil()}, Turno: ${if (turnoManana) "Manana" else "Tarde"}"
    }
}

fun main() {
    val veterinario = Veterinario("Carlos")
    veterinario.realizarAccion()

    val recepcionista = Recepcionista("Maria", true)
    println(recepcionista.obtenerPerfil())

    veterinario.registrarAsistencia()
}