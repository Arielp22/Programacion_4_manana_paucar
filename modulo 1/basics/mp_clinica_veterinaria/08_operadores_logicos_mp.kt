fun main() {
  println("Operadores Lógicos")
  val ayunoCumplido = true
  val consentimientoFirmado = false
  val examenesOk = true
  
  println("&& - And Logico")
  println("$ayunoCumplido && $consentimientoFirmado=${ayunoCumplido && consentimientoFirmado}")
  println("$examenesOk && $ayunoCumplido=${examenesOk && ayunoCumplido}")
  
  println("|| - Or Logico")
  println("$ayunoCumplido || $consentimientoFirmado=${ayunoCumplido || consentimientoFirmado}")
  println("$examenesOk || $ayunoCumplido=${examenesOk || ayunoCumplido}")
  
  println("! - Not")
  println("! $ayunoCumplido=${!ayunoCumplido}")
  println("! $examenesOk =${!examenesOk}")
}