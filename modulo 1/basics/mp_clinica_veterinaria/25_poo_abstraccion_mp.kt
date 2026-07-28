
class ServicioVeterinario(
    val id:       Int,
    val nombre:   String,
    val precio:   Double,
    private val cuposDisponibles: Int      
) {
    val precioConIva: Double 
        get() = precio * 1.15   

    val disponible: Boolean
        get() = cuposDisponibles > 0
        
    override fun toString() = "$nombre ($${"%.2f".format(precio)})"
}

fun main() {
    val consulta = ServicioVeterinario(1, "Consulta General Veterinaria", 35.00, 5)

    println(consulta.disponible)   // true
    println(consulta.precioConIva) // 40.25
    println(consulta)

}