open class Vehiculo(
    val marca: String,
    val modelo: String,
    val anio: Int
) {
    open fun mostrarDatos() {
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Anio: $anio")
    }
}

class Auto(
    marca: String,
    modelo: String,
    anio: Int,
    val numeroPuertas: Int
) : Vehiculo(marca, modelo, anio) {
    override fun mostrarDatos() {
        super.mostrarDatos()
        println("Numero de puertas: $numeroPuertas")
    }
}

class Motocicleta(
    marca: String,
    modelo: String,
    anio: Int,
    val cilindradaCc: Int
) : Vehiculo(marca, modelo, anio) {
    override fun mostrarDatos() {
        super.mostrarDatos()
        println("Cilindrada: ${cilindradaCc}cc")
    }
}

fun main() {
    println("=== Ejercicio 3: Herencia con vehiculos ===")
    val vehiculos: List<Vehiculo> = listOf(
        Auto("Toyota", "Corolla", 2022, 4),
        Motocicleta("Honda", "CB 190R", 2024, 190)
    )

    vehiculos.forEach { vehiculo ->
        println("--- ${vehiculo::class.simpleName} ---")
        vehiculo.mostrarDatos()
    }
    println()
}
