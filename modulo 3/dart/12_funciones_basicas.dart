// Sintaxis completa — preferida para funciones públicas
int sumar(int a, int b) {
  return a + b;
}

// Sintaxis de flecha — cuando el cuerpo es una sola expresión
int multiplicar(int a, int b) => a * b;

// void — cuando no se devuelve nada
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

void main() {
  print(sumar(5, 3));          // 8
  print(multiplicar(4, 6));    // 24
  imprimirSeparador('Inicio'); // ─── Inicio ───
}

// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

// El tercer parámetro es opcional — puede omitirse al llamar
String construirUrl(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host:$puerto$ruta';
  }


void main() {
    saludar();
    print(sumarSinParametros());  // 42
    print(sumar(5, 3));              // 8
    print(multiplicar(4, 6));          // 24
    imprimirSeparador('Inicio');     // ─── Inicio ───
    print(formatearPrecio(1299.9));  // $1299.90
    print(formatearPrecioSinTipo(49.99)); // $49.99
    print(construirUrl('example.com', '/api')); // https://example.com/api
    print(construirUrl('example.com', '/api', 8080)); // https://example.com:8080/api
    print(construirUrlV2('example.com', '/api', null)); // https://example.com/api
}


