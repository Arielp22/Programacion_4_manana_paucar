fun main() {
    val frutas = listOf("manzana", "banana", "cereza", "pera")

    println("Verificar existencia de un elemento: ${"banana" in frutas}")

    println("sublista: ${frutas.subList(1, 3)}")
    println("tomar primeros 2 elementos: ${frutas.take(2)}")
    println("suprimir tres primeros elementos: ${frutas.drop(3)}")
    println("tomar los últimos dos elementos: ${frutas.takeLast(2)}")

    for (fruta in frutas) {
        println(fruta)
    }

    println("Listas Mutables")
    val colores = mutableListOf("blanco", "azul", "amarillo", "rojo")
    printFrutas(colores)
    colores.add("verde")
    println(colores)
    colores.add(0, "morado")
    println(colores)
    colores.remove("verde")
    println(colores)
    colores[1] = "gris"
    println(colores)

    for (color in colores) {
        println(color)
    }

    println("Array deque")
    val deque = ArrayDeque<Int>()

    println(deque)
    deque.addFirst(1)
    println(deque)
    deque.addLast(2)
    println(deque)
    deque.addLast(0)
    println(deque)

    deque.removeFirst()
    println(deque)
    deque.removeLast()
    println(deque)
}

fun printFrutas(colores: List<String>) {
   
}
