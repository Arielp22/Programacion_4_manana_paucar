interface MetodoPago {
    fun procesarPago(monto: Double)
}

class PagoEfectivo : MetodoPago {
    override fun procesarPago(monto: Double) {
        println("Pago en efectivo realizado por $$monto")
    }
}

class PagoTarjeta : MetodoPago {
    override fun procesarPago(monto: Double) {
        val comision = monto * 0.05
        println("Pago con tarjeta realizado por $$monto")
        println("Comision aplicada: $$comision")
    }
}

class PagoTransferencia : MetodoPago {
    override fun procesarPago(monto: Double) {
        println("Transferencia bancaria realizada por $$monto")
        println("Pago procesado electronicamente.")
    }
}

fun main() {
    val monto = 100.0

    val metodosPago: List<MetodoPago> = listOf(
        PagoEfectivo(),
        PagoTarjeta(),
        PagoTransferencia()
    )

    for (metodo in metodosPago) {
        metodo.procesarPago(monto)
    }
}