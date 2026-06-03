sealed class EstadoTurno {
    abstract fun puedeCambiarA(siguiente: EstadoTurno): Boolean

    object Programado : EstadoTurno() {
        override fun puedeCambiarA(siguiente: EstadoTurno) = siguiente is EnEspera || siguiente is Cancelado
    }

    object EnEspera : EstadoTurno() {
        override fun puedeCambiarA(siguiente: EstadoTurno) = siguiente is Atendido || siguiente is Cancelado
    }

    object Atendido : EstadoTurno() {
        override fun puedeCambiarA(siguiente: EstadoTurno) = false
    }

    object Cancelado : EstadoTurno() {
        override fun puedeCambiarA(siguiente: EstadoTurno) = false
    }
}

data class MascotaClinica(
    val id: Int,
    val nombre: String,
    val especie: String,
    var edad: Int,
    var peso: Double
)

data class TurnoClinico(
    val id: String,
    val mascota: MascotaClinica,
    val hora: String,
    var estado: EstadoTurno = EstadoTurno.Programado
)

interface GestorFlujo {
    val nombreModulo: String
    fun procesar(turno: TurnoClinico): Boolean
}

class ModuloAdmision : GestorFlujo {
    override val nombreModulo = "Admision y Recepcion"
    override fun procesar(turno: TurnoClinico): Boolean {
        if (turno.estado !is EstadoTurno.Programado) return false
        turno.estado = EstadoTurno.EnEspera
        println("  [$nombreModulo] -> ${turno.mascota.nombre} paso a Sala de Espera")
        return true
    }
}

class ModuloConsultorio : GestorFlujo {
    override val nombreModulo = "Consultorio Medico"
    override fun procesar(turno: TurnoClinico): Boolean {
        if (turno.estado !is EstadoTurno.EnEspera) return false
        turno.estado = EstadoTurno.Atendido
        println("  [$nombreModulo] -> ${turno.mascota.nombre} fue atendido por el veterinario")
        return true
    }
}

class SistemaClinica(private val modulos: List<GestorFlujo>) {
    private val mascotas = mutableListOf<MascotaClinica>()
    private val turnos = mutableListOf<TurnoClinico>()
    private var siguienteId = 1

    fun registrarMascota(nombre: String, especie: String, edad: Int, peso: Double): MascotaClinica {
        val mascota = MascotaClinica(siguienteId++, nombre, especie, edad, peso)
        mascotas.add(mascota)
        return mascota
    }

    fun agendarTurno(mascota: MascotaClinica, hora: String): TurnoClinico {
        val turno = TurnoClinico("T${turnos.size + 1}", mascota, hora)
        turnos.add(turno)
        return turno
    }

    fun avanzarEstadoTurno(turno: TurnoClinico) {
        println("Procesando turno ${turno.id} de ${turno.mascota.nombre}...")
        val exito = modulos.any { it.procesar(turno) }
        if (!exito) println("  ⚠️ No se pudo avanzar el estado actual del turno")
        println()
    }
}

fun main() {
    val sistema = SistemaClinica(listOf(ModuloAdmision(), ModuloConsultorio()))

    val luna = sistema.registrarMascota("Luna", "Gato", 3, 3.2)
    val roco = sistema.registrarMascota("Roco", "Perro", 5, 12.4)

    val turno1 = sistema.agendarTurno(luna, "09:00")
    val turno2 = sistema.agendarTurno(roco, "09:30")

    sistema.avanzarEstadoTurno(turno1)
    sistema.avanzarEstadoTurno(turno1)

    sistema.avanzarEstadoTurno(turno2)
}