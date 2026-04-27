fun main() {
    println("Set Inmutable")
    
    val numeros = setOf(1, 2, 3, 4, 8, 4, 1, 3)
    println("numeros set: ${numeros}")

    println("Operaciones de conjuntos")
    val pares = setOf(2, 4, 6, 8, 10)
    val multiplos3 = setOf(3, 6, 9, 12)

    println("pares set: ${pares}")
    println("multiplos3 set: ${multiplos3}")
    println("union : ${pares union multiplos3}")
    println("interseccion : ${pares intersect multiplos3}")
    println("substraccion : ${pares subtract multiplos3}")

    println("pares set: ${pares}")
    println("multiplos3 set: ${multiplos3}")
    
    println("Set Mutable")
    val tags = mutableSetOf("Kotlin", "java", "reactnative")
    println(tags)
    tags.add("Kotlin")
    println(tags)
    tags.add("javascript")
    println(tags)
    tags.add("java")
    println(tags)
    println("verificar si el elemento existe ${"kotlin" in tags}")
    println("verificar si el elemento existe ${"java" in tags}")
}
