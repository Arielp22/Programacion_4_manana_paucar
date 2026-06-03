fun main(){
    println("Listas")
    val pacientes = listOf("Luna", "Roco", "Milo", "Roco", "Nina")
    println("Size: ${pacientes.size}")
    println("Mostrar el elemento indice 0:${pacientes[0]}")
    println("Mostrar el primer elemento: ${pacientes.first()}")
    println("Mostrar el ultimo elemento: ${pacientes.last()}")
    
    println("Mostrar el elemento indice 2: ${pacientes.get(2)}")
    println("Mostrar indice contenido elemento: ${pacientes.indexOf("Roco")}")
    println("Verificar existencia de elemnento: ${pacientes.contains("Milo")}")
    println("Verificar existencia de un eemento: ${"Roco" in pacientes}")

    println("Sublista: ${pacientes.subList(1,3)}")
    println("tomar primeros 2 elementos: ${pacientes.take(2)}")
    println("suprimir tres primeros elementos : ${pacientes.drop(3)}")
    println("tomar los ultimos dos elementos: ${pacientes.takeLast(2)}")
    
    for (paciente in pacientes) {
        println(paciente)
    }
    
    println("Listas-Mutable")
    val vacunas = mutableListOf("rabia", "moquillo", "parvovirus", "quíntuple")
    println(vacunas)
    vacunas.add("leptospirosis")
    println(vacunas)
    vacunas.add(0,"desparasitación")
    println(vacunas)
    vacunas.remove("moquillo")
    println(vacunas)
    vacunas[1]="triple felina"
    println(vacunas)
    
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