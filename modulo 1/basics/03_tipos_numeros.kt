fun main() {
    val numero1: Byte = 127
    println("Numero byte $numero1")

    val numero2: Short = 32_765
    println("Numero short $numero2")

    val numero3: Int = 12
    println("Numero int $numero3")

    val numero4: Long = 12_122_122_1222_123_123L
    println("Numero long $numero4")

    val numero5: Float = 3.14232f
    println("Numero float $numero5")

    val numero6: Double = 3.14232
    println("Numero Double $numero6")
}


// inferido

val nombre="Juan"
val edad=56
println("Nombre $nombre")

val nombreTipo=nombre::class.simpleName
println("Tipo inferido nombre: ${nombreTipo}")
println("Tipo inferido nombre: ${nombreTipo}")
val edadTipo=edad::class.simpleName
println("Tipo inferido nombre: ${nombreTipo}")
println("Tipo inferido nombre: ${nombreTipo}")
