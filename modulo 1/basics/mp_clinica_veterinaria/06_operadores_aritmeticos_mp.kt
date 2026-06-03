fun main() {
    val consulta = 35.0
    val vacuna = 18.0
    val medicamento = 12.5
    val descuento = 5.0

    val subtotal = consulta + vacuna + medicamento
    val total = subtotal - descuento
    val totalConIva = total * 1.18

    println("Subtotal: $$subtotal")
    println("Total con descuento: $$total")
    println("Total con IVA: $${"%.2f".format(totalConIva)}")
}