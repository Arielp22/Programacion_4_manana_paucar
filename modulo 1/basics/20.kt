fun main() {
    println("funciones")
    
    val saludo = saludo()
    println("$saludo")

    val suma: Int = sumar(5, 4)
    println(suma)

    println(restarTipoExpresion(5, 3))
}

fun saludo(): String {
    return "hello"
}

fun sumar(a: Int, b: Int): Int {
    return a + b
}

//tipo de expresion
fun restarTipoExpresion(a: Int, b: Int): Int = a - b

//Inferido
fun restarTipoInferido(a: Int, b: Int): Int = a - b

