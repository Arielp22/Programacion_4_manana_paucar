data class Paciente(
    val id: Int,
    val nombre: String,
    val especie: String,
    val edad: Int,
    val activo: Boolean = true
)

fun main() {
    val p1 = Paciente(1, "Luna", "Gato", 3)
    val p2 = Paciente(1, "Luna", "Gato", 3)
    val p3 = Paciente(2, "Milo", "Perro", 5)

    println(p1)  

    println(p1 == p2)   
    println(p1 == p3)   

    val cumpleanos = p1.copy(edad = 4)
    val inactivo = p1.copy(activo = false)

    val (id, nombre, especie) = p1
    println("$id: $nombre — $especie")

    listOf(p1, p3).forEach { (id2, nombre2, especie2) ->
        println("[$id2] $nombre2: $especie2")
    }
}