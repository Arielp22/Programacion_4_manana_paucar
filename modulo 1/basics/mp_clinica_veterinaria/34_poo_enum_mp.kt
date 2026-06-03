enum class EstadoCita(val descripcion: String, val esFinal: Boolean) {
    PROGRAMADA("Cita agendada", false),
    EN_ESPERA("Paciente en sala de espera", false),
    ATENDIDA("Consulta finalizada con éxito", true),
    CANCELADA("Cita cancelada", true);

    fun puedeCambiarA(siguiente: EstadoCita): Boolean = when (this) {
        PROGRAMADA -> siguiente == EN_ESPERA || siguiente == CANCELADA
        EN_ESPERA -> siguiente == ATENDIDA || siguiente == CANCELADA
        else -> false
    }
}

fun main() {
    val estado = EstadoCita.EN_ESPERA
    println(estado.descripcion)  
    println(estado.esFinal)       

    val icono = when (estado) {
        EstadoCita.PROGRAMADA -> "📅"
        EstadoCita.EN_ESPERA  -> "⏳"
        EstadoCita.ATENDIDA   -> "✅"
        EstadoCita.CANCELADA  -> "❌"
    }
    println(icono)  

    println(estado.puedeCambiarA(EstadoCita.ATENDIDA))  
}