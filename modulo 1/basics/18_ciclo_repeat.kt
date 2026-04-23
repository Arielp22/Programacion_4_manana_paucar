fun main() {
    println("Controles de flujo Iteraciones. Ciclo repetitivo - While")
    println("While básico")

    var contador = 1

    while (contador <= 5) {
        println(contador)
        contador++
    } 

    
    println("Do While")
    contador = 1
    do {
        println(contador)
        contador++
    } while (contador <= 5)

    
    println("break continue")
    contador = 0 
    while (contador < 10) {
        contador++
        
        
        if (contador == 3) continue
        if (contador == 7) break
        
        println(contador)
    }
    
 
   var input: String
   while(true){
      println("Escribe 'salir' para terminar:")
      input=readLine()?:" "
      if (input=="salir") break
      println("usted ingreso: $input")
   }
     
}


fun main() {
    var input: String
    
    while (true) {
        println("Menu: saludar, sumar, tabla, salir")
        println("Escribe una opcion: ")
        
        input = readLine() ?: ""

        
        when (input) {
            "saludar" -> println("Hola como estas")
            
            "sumar" -> {
                println("Ingresa un numero:")
                val a = readLine()?.toInt() ?: 0
                println("Ingresa otro:")
                val b = readLine()?.toInt() ?: 0
                println("Resultado: ${a + b}")
            }
            
            "tabla" -> {
                var c = 1
                while (c <= 10) {
                    println("5 x $c = ${5 * c}") 
                    c++
                }
            }
            
            "salir" -> break 
            
    else -> println("Opcion no valida")
        }
    }
}
