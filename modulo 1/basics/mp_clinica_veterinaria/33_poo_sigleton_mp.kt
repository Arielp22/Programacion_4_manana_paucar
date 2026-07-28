object SystemConfig {
    val host: String = "api.veterinaria.com"
    val puerto: Int = 443
    private val apiKey: String = "sk-vet-secreto-123"

    fun baseUrl() = "https://$host:$puerto"
    fun headers() = mapOf("Authorization" to "Bearer $apiKey")
}

class Paciente private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        fun crear(nombre: String, emailDueno: String): Paciente? {
            if (nombre.isBlank() || !emailDueno.contains("@")) return null
            return Paciente(++contadorId, nombre.trim())
        }

        const val TIPO_DEFECTO = "Domestico"
    }
}

fun main() {
    println(SystemConfig.baseUrl()) 

    val p = Paciente.crear("Luna", "dueno@test.com")
    if (p != null) {
        println("Paciente creado -> ID: ${p.id}, Nombre: ${p.nombre}")
    }
}