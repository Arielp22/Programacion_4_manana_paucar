fun main(){
    println("Funciones")
    val saludo = saludo()
    println("$saludo")
    val suma: Int = sumar(5,4)
    println(suma)
    println("${restarTipoExpresion(5,3)}")
    println(restarTipoExpresion(5,3))
    println(restarTipoInferido(5,3))
    saludar("Pedro")
}
fun saludo(): String{
    return "hola desde la funcion"
}
fun sumar(a: Int, b: Int): Int{
    return a+b
}

fun restarTipoExpresion(a:  Int, b: Int)=a-b
fun restarTipoInferido(a:  Int, b: Int)=a-b
fun saludar(nombre: String){
    println("Hola $nombre")
}