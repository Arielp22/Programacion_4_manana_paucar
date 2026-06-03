abstract class Mascota(val nombre: String) {
    // abstract — Las subclases DEBEN implementar esto obligatoriamente
    abstract val peso: Double
    abstract val tipoAlimentacion: String
    abstract fun emitirSonido(): String

    // concreto — Disponible para todas las subclases (reutilizacion de codigo)
    fun compararPeso(otra: Mascota): String = when {
        peso > otra.peso -> "$nombre es mas pesado/a que ${otra.nombre}"
        peso < otra.peso -> "$nombre es mas liviano/a que ${otra.nombre}"
        else             -> "$nombre y ${otra.nombre} pesan exactamente lo mismo"
    }

    // Polimorfismo: toString usa propiedades y metodos abstractos que se resuelven en tiempo de ejecucion
    override fun toString() = "Paciente: $nombre | Peso: ${"%.2f".format(peso)} kg | Dieta: $tipoAlimentacion | Sonido: ${emitirSonido()}"
}

class Perro(nombre: String, override val peso: Double) : Mascota(nombre) {
    override val tipoAlimentacion = "Croquetas Caninas"
    override fun emitirSonido() = "Guau!"
}

class Gato(nombre: String, override val peso: Double) : Mascota(nombre) {
    override val tipoAlimentacion = "Alimento Humedo Felino"
    override fun emitirSonido() = "Miau!"
}

class Loro(nombre: String, override val peso: Double) : Mascota(nombre) {
    override val tipoAlimentacion = "Semillas y Frutas"
    override fun emitirSonido() = "¡Hola! *silbido*"
}

fun main() {
    // POLIMORFISMO: La lista acepta cualquier subclase de Mascota
    val pacientes: List<Mascota> = listOf(
        Gato("Luna", 3.2),
        Perro("Roco", 12.5),
        Loro("Tito", 0.4)
    )

    println("=== Historial Clinico de Pacientes ===")
    pacientes.forEach { println(it) } // Llama al toString() polimorfico de cada uno

    val masPesado = pacientes.maxByOrNull { it.peso }
    println("\nPaciente que requiere bascula grande: ${masPesado?.nombre}")

    println(pacientes[0].compararPeso(pacientes[1])) // Luna vs Roco
}