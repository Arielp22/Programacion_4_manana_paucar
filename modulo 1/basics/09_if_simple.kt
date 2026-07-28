
fun main() {
  println("Controles de Flujo")
  println("Condicional If")
  println("Incluir Temperatura en grados centigrados: ")
  val temperatura =readLine()?.toDoubleOrNull()?: 36.5
  if(temperatura>=38.0){
      println("Fiebre detectada: derivar consulta prioritaria")
  }
  if(temperatura>=40.0){
      println("Fiebre alta: atención de emergencia inmediata")
  }
  println("Temperatura registrada: $temperatura grados centigrados")
}