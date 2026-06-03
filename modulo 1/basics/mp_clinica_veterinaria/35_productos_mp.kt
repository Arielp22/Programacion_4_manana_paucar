data class Categoria(val id: Int, val nombre: String)

data class ServicioVeterinario(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val cuposDisponibles: Int,
    val categoria: Categoria,
    val activo: Boolean = true
) {
    val disponible: Boolean get() = activo && cuposDisponibles > 0
    val precioConIva: Double get() = precio * 1.15

    fun aplicarDescuento(porcentaje: Double): ServicioVeterinario {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object CatalogoServicios {
    private val categorias = mutableListOf(
        Categoria(1, "Consultas"),
        Categoria(2, "Vacunación"),
        Categoria(3, "Estética")
    )
    private val servicios = mutableListOf<ServicioVeterinario>()
    private var siguienteId = 1

    fun agregarServicio(nombre: String, precio: Double, cuposDisponibles: Int, categoriaId: Int): ServicioVeterinario? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val servicio = ServicioVeterinario(siguienteId++, nombre, precio, cuposDisponibles, categoria)
        servicios.add(servicio)
        return servicio
    }

    fun listar(): List<ServicioVeterinario> = servicios.toList()
    fun disponibles(): List<ServicioVeterinario> = servicios.filter { it.disponible }
}

fun main() {
    CatalogoServicios.agregarServicio("Consulta General", 35.00, 5, 1)
    CatalogoServicios.agregarServicio("Consulta de Especialidad", 50.00, 0, 1)
    CatalogoServicios.agregarServicio("Vacuna Triple Felina", 18.00, 8, 2)
    CatalogoServicios.agregarServicio("Profilaxis Dental", 60.00, 2, 3)

    println("=== Todos los servicios veterinarios ===")
    CatalogoServicios.listar().forEach { s ->
        val estado = if (s.disponible) "✅" else "❌"
        println("$estado ${s.nombre} — ${"%.2f".format(s.precioConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoServicios.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.precio)}") }
}