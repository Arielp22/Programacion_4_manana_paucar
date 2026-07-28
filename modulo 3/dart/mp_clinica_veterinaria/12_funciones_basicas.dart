int sumar(int a, int b) {
  return a + b;
}

int multiplicar(int a, int b) => a * b;

void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

void saludar() {
  print('Bienvenido a la clínica veterinaria');
}

int sumarSinParametros() {
  return 42;
}

String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

String construirUrl(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host:$puerto$ruta';
  }
  return 'https://$host$ruta';
}

String construirUrlV2(String host, String ruta, int? puerto) {
  return puerto == null ? 'https://$host$ruta' : 'https://$host:$puerto$ruta';
}

void main() {
    saludar();
    print(sumarSinParametros());
    print(sumar(5, 3));
    print(multiplicar(4, 6));
    imprimirSeparador('Inicio');
    print(formatearPrecio(1299.9));
    print(formatearPrecioSinTipo(49.99));
    print(construirUrl('clinica.com', '/citas'));
    print(construirUrl('clinica.com', '/citas', 8080));
    print(construirUrlV2('clinica.com', '/citas', null));
}
