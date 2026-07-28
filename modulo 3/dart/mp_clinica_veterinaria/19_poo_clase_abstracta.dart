abstract class Diagnostico {
  String get nombre;
  double calcularCosto();
  double calcularTiempo();

  void describir() {
    print('$nombre — costo: ${calcularCosto().toStringAsFixed(2)}, tiempo: ${calcularTiempo().toStringAsFixed(2)} min');
  }
}

class Eco extends Diagnostico {
  final double duracion;
  Eco(this.duracion);

  @override String get nombre => 'Ecografía (dur=$duracion)';
  @override double calcularCosto() => 30.0 * duracion;
  @override double calcularTiempo() => duracion;
}

class RayosX extends Diagnostico {
  final double duracion;
  RayosX(this.duracion);

  @override String get nombre => 'Rayos X (${duracion}min)';
  @override double calcularCosto() => 20.0 * duracion;
  @override double calcularTiempo() => duracion;
}

void main() {
  final servicios = <Diagnostico>[Eco(15), RayosX(10)];
  for (final s in servicios) {
    s.describir();
  }
}
