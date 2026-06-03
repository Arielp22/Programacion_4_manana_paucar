fun main() {
  println("Controles de Flujo")
  println("Condicional If - Multiples condiciones")
  println("Edad del paciente (en años): ")
  val edad = readLine()?.toIntOrNull() ?: 0
  
  val clasificacion = if (edad < 1) {
      "Cachorro"
  } else if (edad <= 2) {
      "Joven"
  } else if (edad <= 7) {
      "Adulto"
  } else if (edad <= 11) {
      "Senior"
  } else {
      "Geriatrico"
  }
  
  println("Clasificacion: $clasificacion.uppercase()")
  println("Clasificacion: ${clasificacion.uppercase()}")
}