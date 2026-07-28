fun main() {
    val nombreClinica = "Clínica Veterinaria MP"
    val ciudad = "Quito"
    var pacientesEnEspera = 3
    val tarifaConsulta = 35.0

    println("$nombreClinica - $ciudad")
    println("Pacientes en espera: $pacientesEnEspera")

    pacientesEnEspera += 2
    println("Pacientes en espera actualizados: $pacientesEnEspera")
    println("Tarifa de consulta: $$tarifaConsulta")
}