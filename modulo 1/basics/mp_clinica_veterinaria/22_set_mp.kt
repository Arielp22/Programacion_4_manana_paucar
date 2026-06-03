fun main() {
    val especies = setOf("perro", "gato", "conejo", "gato", "perro")
    println("Especies únicas: $especies")

    val vacunasPerro = setOf("rabia", "moquillo", "parvovirus")
    val vacunasGato = setOf("rabia", "triple felina", "leucemia")

    println("Unión: ${vacunasPerro union vacunasGato}")
    println("Intersección: ${vacunasPerro intersect vacunasGato}")
    println("Diferencia: ${vacunasPerro subtract vacunasGato}")
}