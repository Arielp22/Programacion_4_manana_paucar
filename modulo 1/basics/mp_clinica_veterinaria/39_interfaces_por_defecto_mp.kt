interface Serializable {
    val id: String                    
    fun serializar(): String          
    val version: Int get() = 1        
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {                
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

data class HistorialClinico(
    override val id: String,
    val paciente: String,
    val diagnostico: String,
    val medicamentos: List<String>,
    val costoConsulta: Double
) : Serializable, Validable {

    override fun serializar() = 
        "$id|$paciente|$diagnostico|${medicamentos.joinToString(",")}|$costoConsulta"

    override val errores: List<String> get() = buildList {
        if (paciente.isBlank()) add("El nombre del paciente no puede estar vacio")
        if (diagnostico.isBlank()) add("El diagnostico medico no puede estar vacio")
        if (costoConsulta < 0) add("El costo de la consulta no puede ser negativo")
    }

    override fun validar() = esValido
}

fun main() {
    val historial1 = HistorialClinico("H001", "Luna", "Control de vacunas", listOf("Triple Felina"), 35.0)
    val historial2 = HistorialClinico("H002", "", "", emptyList(), -10.0)

    fun respaldarEnBaseDatos(s: Serializable) = println("Guardando registro → ${s.serializar()}")
    
    fun verificarFichaMedica(v: Validable) {
        println("Ficha valida: ${v.esValido}")
        v.imprimirErrores()
        println()
    }

    println("=== Procesando Historial 1 ===")
    respaldarEnBaseDatos(historial1)
    verificarFichaMedica(historial1)

    println("=== Procesando Historial 2 ===")
    verificarFichaMedica(historial2)
}