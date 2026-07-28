fun main() {
  println("Controles de Flujo")
  println("Condicional If")
  println("Incluir Temperatura de la mascota en grados centigrados: ")
  val temperatura = readLine()?.toDoubleOrNull() ?: 38.5
  
  if (temperatura >= 39.5) {
      println("Fiebre detectada: derivar consulta prioritaria")
  }
  if (temperatura >= 41.0) {
      println("Fiebre alta: atención de emergencia inmediata")
  }
  println("Temperatura registrada: $temperatura grados centigrados")
}