open class CuentaClinica(val paciente: String, saldoInicial: Double) {

    private var saldo: Double = saldoInicial  

    internal val codigoRegistro: String =        
        "VET${(100000..999999).random()}"

    protected open fun calcularDescuentoFrecuente(): Double = saldo * 0.05  

    fun cobrarServicio(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }
        saldo += monto
        println("Cobrado: $${"%.2f".format(monto)} | Saldo actual: ${consultarSaldo()}")
    }

    fun registrarDevolucion(monto: Double): Boolean {
        require(monto > 0) { "El monto debe ser positivo" }
        if (monto > saldo) {
            println("No se puede devolver ese monto: supera el saldo")
            return false
        }
        saldo -= monto
        println("Devuelto: $${"%.2f".format(monto)} | Saldo actual: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(saldo)}"
}

fun main() {
    val cuenta = CuentaClinica("Luna", 35.0)

    cuenta.cobrarServicio(18.0)    
    cuenta.registrarDevolucion(5.0)      
    cuenta.registrarDevolucion(100.0)     

    println(cuenta.paciente)         
    println(cuenta.consultarSaldo()) 
}