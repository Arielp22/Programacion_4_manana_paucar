class Mascota(val nombre: String, val edad: Int)

class Mascota2(val nombre: String, val edad: Int) {
    fun presentarse() = "Paciente: $nombre, Edad: $edad años"
    fun esCachorro() = edad < 1
}

fun main() {
    val m = Mascota("Luna", 3)
    println(m.nombre)   
    println(m.edad)     

    val m2 = Mascota2("Milo", 0)
    println(m2.presentarse())     
    println(m2.esCachorro())   
}