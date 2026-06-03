fun main() {
    println("Utilidades List")
    println("map")
    
    val costos = listOf(35, 18, 42, 25, 60, 15, 50, 8, 30, 45)
    println(costos)
  
    val cuadrados = costos.map { it * it }
    println(cuadrados)

    val costosTexto = costos.map { "Cost$it" }
    println(costosTexto)
    
    println("filter")
    val pares = costos.filter { it % 2 == 0 }
    println(pares)

    val mayores5 = costos.filter { it > 5 }
    println(mayores5)

    val paresYMayores5 = costos.filter { it % 2 == 0 && it > 5 }
    println(paresYMayores5)

    val impares = costos.filterNot { it % 2 == 0 }
    println(impares)
    
    val mezcla: List<Any> = listOf(35, "Luna", 18, "Roco", true, 42)
    val soloStrings = mezcla.filterIsInstance<String>()
    println(soloStrings)
    
    println("reduce")
    val costosReduce = listOf(35, 18, 42, 25, 60)
    
    val suma = costosReduce.reduce { acc, n -> acc + n }
    println(suma)

    val producto = costosReduce.reduce { acc, n -> acc * n }
    println(producto)
    
    println("fold")
    val sumaFold = costosReduce.fold(100) { acc, n -> acc + n }
    println(sumaFold)

    val productoFold = costosReduce.fold(100) { acc, n -> acc * n }
    println(productoFold)
    
    println("Ordenaciones")
    println("Ascendente: ${costos.sorted()}")
    println("Descendente: ${costos.sortedDescending()}")
    println("Sorter by: ${costos.sortedBy { -it }}")
    
    println("Agregacion")
    println("Sumar : ${costos.sum()}")
    println("Promedio : ${costos.average()}")
    println("Minimo : ${costos.minOrNull()}")
    println("Maximo : ${costos.maxOrNull()}")
    println("Contar : ${costos.count { it > 4 }}")

    println("Busqueda")
    println("Buscar : ${costos.find { it > 4 }}") 
    println("Buscar ultimo : ${costos.findLast { it > 4 }}") 
    println("Buscar any : ${costos.any { it > 4 }}") 
    println("Buscar all : ${costos.all { it > 0 }}") 
    println("Buscar none : ${costos.none { it > 10 }}")
}