fun main() {
    println("Escribe el nombre de la mascota:")
    val nombreMascota = readLine()
    println("Mascota incluida: $nombreMascota")

    println("Escribe el nombre del dueño:")
    val duenio = readLine() ?: "anonimo"
    println("Dueño incluido: $duenio")
}