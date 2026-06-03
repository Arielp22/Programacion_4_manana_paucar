fun main() {
    println("Map Inmutable")
    val pacientes = mapOf(
        "Mascota01" to "Luna",
        "Mascota02" to "Roco",
        "Mascota03" to "Milo",
        "Mascota04" to "Nina"
    )
    
    println(pacientes["Mascota01"])
    println(pacientes["Mascota09"])
    println(pacientes.getOrDefault("Mascota01", "Desconocido"))
    println(pacientes.getOrDefault("Mascota09", "Desconocido"))
    println(pacientes)
    println(pacientes.keys)
    println(pacientes.values)
    println(pacientes.entries)
    
    for ((codigo, nombre) in pacientes) {
        println("$codigo = $nombre")
    }
    
    println("Map Mutable")
    val inventario = mutableMapOf(
        "Vacunas" to 10,
        "Medicina" to 4,
        "Gasa" to 12,
        "Jeringas" to 8
    )
    
    inventario["Alcohol"] = 5
    println(inventario)
    inventario["Vacunas"] = 20
    println(inventario)
    inventario.remove("Jeringas")
    println(inventario)
    inventario.getOrPut("Antibiotico") { 15 }
    println(inventario)
    inventario.getOrPut("Gasa") { 15 }
    println(inventario)
}