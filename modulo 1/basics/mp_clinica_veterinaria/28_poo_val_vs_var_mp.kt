class FichaPaciente(
    val id: Int,
    val nombre: String,
    var peso: Double,
    var vacunado: Boolean
)

fun main() {
    val ficha = FichaPaciente(1, "Luna", 3.2, false)

    println("${ficha.nombre} pesa ${ficha.peso} kg")
    ficha.peso = 3.4
    ficha.vacunado = true
    println("${ficha.nombre} ahora pesa ${ficha.peso} kg y vacunado=${ficha.vacunado}")
}