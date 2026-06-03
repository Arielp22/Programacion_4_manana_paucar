class TemperaturaPaciente(temperaturaInicial: Double) {
    var temperatura: Double = temperaturaInicial
        set(value) {
            field = if (value < 30.0) 30.0 else value
        }

    val tieneFiebre: Boolean
        get() = temperatura >= 39.5
}

fun main() {
    val control = TemperaturaPaciente(38.6)
    println(control.temperatura)
    control.temperatura = 40.2
    println(control.temperatura)
    println("¿Tiene fiebre? ${control.tieneFiebre}")
}