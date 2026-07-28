void main() {
  final cuadrado = (int n) => n * n;
  print(cuadrado(7));

  final calcularDescuento = (double precio, double pct) {
    final descuento = precio * (pct / 100);
    return precio - descuento;
  };
  print(calcularDescuento(100.0, 15.0));

  final numeros = [3, 1, 4, 1, 5, 9, 2, 6];
  numeros.sort((a, b) => b.compareTo(a));
  print(numeros);
}
