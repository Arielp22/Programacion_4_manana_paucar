package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp


@Composable
fun CompraProducto() {
    // Definición de los estados para capturar los datos
    var nombreProducto by remember { mutableStateOf("") }
    var cantidad by remember { mutableStateOf("") }
    var precio by remember { mutableStateOf("") }

    // Estados para mostrar los resultados
    var subTotal by remember { mutableStateOf("") }
    var descuento by remember { mutableStateOf("") }
    var totalAPagar by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // --- Campo: Nombre del Producto ---
        OutlinedTextField(
            value = nombreProducto,
            onValueChange = { nombreProducto = it },
            label = { Text(text = "Nombre de Producto") },
            leadingIcon = { Icon(imageVector = Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // --- Campo: Cantidad ---
        OutlinedTextField(
            value = cantidad,
            onValueChange = { cantidad = it },
            label = { Text(text = "Cantidad") },
            leadingIcon = { Icon(imageVector = Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // --- Campo: Precio ---
        OutlinedTextField(
            value = precio,
            onValueChange = { precio = it },
            label = { Text(text = "Precio") },
            leadingIcon = { Icon(imageVector = Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // --- Botón de Calcular ---
        Button(
            onClick = {
                val precioDouble = precio.toDoubleOrNull() ?: 0.0
                val cantidadDouble = cantidad.toDoubleOrNull() ?: 0.0
                val subTotalDouble = precioDouble * cantidadDouble

                var porcentaje = 0.0

                // Lógica de descuento según las capturas
                if (subTotalDouble > 50) {
                    porcentaje = 0.1 // 10%
                } else if (subTotalDouble > 20) {
                    porcentaje = 0.05 // 5%
                }

                val descuentoDouble = subTotalDouble * porcentaje
                val totalAPagarDouble = subTotalDouble - descuentoDouble

                // Asignación de resultados a los estados para mostrar en la UI
                subTotal = subTotalDouble.toString()
                descuento = descuentoDouble.toString()
                totalAPagar = totalAPagarDouble.toString()
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(text = "Calcular")
        }

        // --- Mostrar Resultados ---
        Text(text = "Nombre del Producto: $nombreProducto")
        Text(text = "Subtotal: $subTotal")
        Text(text = "Descuento: $descuento")
        Text(text = "Total a Pagar: $totalAPagar")
    }
}
