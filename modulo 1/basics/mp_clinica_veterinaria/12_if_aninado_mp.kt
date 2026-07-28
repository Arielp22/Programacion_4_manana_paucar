fun main() {
  println("Controles de Flujo")
  println("Condicional If - Anidado")
  println("¿Tiene antecedentes cardíacos la mascota (s/n)?")
  val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"
  
  println("Frecuencia Cardíaca (lpm)")
  val frecuencia = readLine()?.toIntOrNull() ?: 0
  
  if (tieneAntecedentes) {
    println("Paciente con antecedentes cardiacos")
    if (frecuencia < 60) { 
        println("Bradicardia severa")
    } else if (frecuencia > 140) {
        println("Taquicardia")
    } else {
        println("Frecuencia Normal")
    }
  } else {
    println("Paciente sin antecedentes cardiacos")
    if (frecuencia < 60 || frecuencia > 140) {
        println("Frecuencia fuera del rango normal")
    } else {
        println("Frecuencia Cardiaca Normal")
    }
  }
}