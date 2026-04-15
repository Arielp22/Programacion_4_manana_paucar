fun main() {
    println("Funciones-Parametros por defecto")
    println(crearUsuario("Jhon",25,"admin", true))
    println(crearUsuario("Luis"))
    println(crearUsuario("Maria",25))
    println(crearUsuario("Jhon",30,"admin"))
    
}

fun crearUsuario(
    nombre: String,
    edad: Int = 18,
    rol: String = "viewer",
    activo: Boolean = true
): String {
    return "Usuario[$nombre, edad=$edad, rol=$rol, activo=$activo]"
}
