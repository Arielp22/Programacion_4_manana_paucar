fun main() {
    val temperaturaPaciente: Byte = 39
    println("Numero byte $temperaturaPaciente")

    val pesoGato: Short = 4
    println("Numero short $pesoGato")

    val consultasDelDia: Int = 12
    println("Numero int $consultasDelDia")

    val totalVacunas: Long = 150L
    println("Numero long $totalVacunas")

    val dosisMedicamento: Float = 2.5f
    println("Numero float $dosisMedicamento")

    val porcentajeDescuento: Double = 0.15
    println("Numero Double $porcentajeDescuento")

    val nombreMascota = "Thor"
    val edadMascota = 5
    println("Nombre $nombreMascota")

    val tipoNombre = nombreMascota::class.simpleName
    println("Tipo inferido nombre: ${tipoNombre}")
    println("Tipo inferido nombre: ${tipoNombre}")
    
    val tipoEdad = edadMascota::class.simpleName
    println("Tipo inferido nombre: ${tipoNombre}")
    println("Tipo inferido nombre: ${tipoNombre}")
}