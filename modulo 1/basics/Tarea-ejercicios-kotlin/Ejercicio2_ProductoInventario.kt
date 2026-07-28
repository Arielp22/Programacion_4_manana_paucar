class ProductoInventario(
    val codigo: String,
    val nombre: String,
    private var precio: Double,
    private var stock: Int
) {

    fun consultarPrecio() {
        println("Precio: $$precio")
    }

    fun consultarStock() {
        println("Stock: $stock")
    }

    fun cambiarPrecio(nuevoPrecio: Double) {
        if (nuevoPrecio >= 0) {
            precio = nuevoPrecio
            println("Precio actualizado a $$precio")
        } else {
            println("Error: el precio no puede ser menor a cero")
        }
    }

    fun aumentarStock(cantidad: Int) {
        stock += cantidad
        println("Stock actualizado: $stock")
    }

    fun disminuirStock(cantidad: Int) {
        if (stock - cantidad >= 0) {
            stock -= cantidad
            println("Stock actualizado: $stock")
        } else {
            println("Error: stock insuficiente.")
        }
    }
}

fun main() {
    val producto = ProductoInventario(
        "P001",
        "Laptop",
        800.0,
        10
    )

    producto.consultarPrecio()
    producto.consultarStock()

    producto.cambiarPrecio(850.0)

    producto.aumentarStock(5)

    producto.disminuirStock(8)

    producto.disminuirStock(20)
}