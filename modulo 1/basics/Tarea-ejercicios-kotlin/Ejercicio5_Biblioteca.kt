class Libro(
    val id: Int,
    val titulo: String,
    val autor: String
) {
    var disponible = true

    fun mostrar() {
        println("ID: $id | $titulo | $autor | ${if (disponible) "Disponible" else "Prestado"}")
    }
}

fun main() {

    val libros = mutableListOf<Libro>()
    var opcion: Int

    do {
        println("\nSISTEMA DE BIBLIOTECA")
        println("1. Registrar libro")
        println("2. Listar libros disponibles")
        println("3. Prestar libro")
        println("4. Devolver libro")
        println("5. Buscar libro por titulo")
        println("0. Salir")
        print("Seleccione una opcion: ")

        opcion = readln().toInt()

        when (opcion) {

            1 -> {
                print("ID: ")
                val id = readln().toInt()

                print("Titulo: ")
                val titulo = readln()

                print("Autor: ")
                val autor = readln()

                libros.add(Libro(id, titulo, autor))
                println("Libro registrado correctamente.")
            }

            2 -> {
                println("\n===== LIBROS DISPONIBLES =====")
                libros.filter { it.disponible }
                    .forEach { it.mostrar() }
            }

            3 -> {
                print("ID del libro: ")
                val id = readln().toInt()

                val libro = libros.find { it.id == id }

                if (libro == null)
                    println("Libro no encontrado.")
                else if (!libro.disponible)
                    println("El libro ya esta prestado.")
                else {
                    libro.disponible = false
                    println("Prestamo realizado.")
                }
            }

            4 -> {
                print("ID del libro: ")
                val id = readln().toInt()

                val libro = libros.find { it.id == id }

                if (libro == null)
                    println("Libro no encontrado.")
                else if (libro.disponible)
                    println("El libro ya esta disponible.")
                else {
                    libro.disponible = true
                    println("Devolucion realizada.")
                }
            }

            5 -> {
                print("Titulo a buscar: ")
                val titulo = readln()

                libros.filter {
                    it.titulo.equals(titulo, true)
                }.forEach {
                    it.mostrar()
                }
            }

            0 -> println("Programa finalizado.")
        }

    } while (opcion != 0)
}