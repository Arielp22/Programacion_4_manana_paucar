class Libro(
        val titulo: String,
        val autor: String,
        val anioPublicacion: Int,
        val numeroPaginas: Int
) {
    fun mostrarInformacion() {
        println("Titulo: $titulo")
        println("Autor: $autor")
        println("Anio de publicacion: $anioPublicacion")
        println("Numero de paginas: $numeroPaginas")
    }

    fun esAntiguo(): Boolean = anioPublicacion < 2000

    fun mostrarEstado() {
        val estado = if (esAntiguo()) "antiguo" else "reciente"
        println("El libro '$titulo' es $estado")
    }
}

fun main() {
    println("Ejercicio 1: Clase Libro")
    val libro1 = Libro("Programacion 4", "Ariel Paucar", 2008, 464)
    val libro2 = Libro("El principito", "Ariel Paucar", 1943, 96)

    libro1.mostrarInformacion()
    libro1.mostrarEstado()
    println()
    libro2.mostrarInformacion()
    libro2.mostrarEstado()
    println()
}
