void main() {
  final precios = [29.99, 49.50, 15.00, 99.99];
  final preciosConIva = precios.map((p) => p * 1.15);
  print(preciosConIva.toList());

  final endpoints = ['/pacientes', '/citas', '/vacunas'];
  final urls = endpoints.map((e) => 'https://api.clinica-vet.com$e');
  print(urls.toList());

  final temperaturas = [36.1, 37.8, 39.2, 36.5, 38.7, 35.9];
  final conFiebre = temperaturas.where((t) => t > 37.5);
  print(conFiebre.toList());

  final normales = temperaturas.where((t) => t >= 36.0 && t <= 37.5);
  print(normales.toList());
}
