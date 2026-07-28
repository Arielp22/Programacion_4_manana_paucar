interface Pagable {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : Pagable {
    override val nombre = "Tarjeta de credito"
    override fun procesar(monto: Double): Boolean {
        println("💳 Procesando cobro de vete de $${"%.2f".format(monto)} a la tarjeta $numero")
        return true
    }
}

class PayPal(val email: String) : Pagable {
    override val nombre = "PayPal"
    override fun procesar(monto: Double): Boolean {
        println("🅿️ Cobrando consulta de $${"%.2f".format(monto)} a la cuenta PayPal: $email")
        return true
    }
}

class Efectivo : Pagable {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("💵 Pago de $${"%.2f".format(monto)} recibido en la caja de la veterinaria")
        return true
    }
}

fun cobrarServicio(monto: Double, metodoPago: Pagable) {
    println("Iniciando transaccion con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago de servicio veterinario exitoso\n" else "❌ Pago fallido\n")
}

fun main() {
    val metodosCaja: List<Pagable> = listOf(
        TarjetaCredito("**** **** **** 4321"),
        PayPal("dueno_luna@test.com"),
        Efectivo()
    )

    // Polimorfismo aplicado al sistema de cobros de la veterinaria
    metodosCaja.forEach { cobrarServicio(35.00, it) }
}