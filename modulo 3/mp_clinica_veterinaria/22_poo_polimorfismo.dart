abstract class Mascota {
  String get nombre;
  double calcularCostoAtencion();
}

class Perro extends Mascota {
  final double peso;
  final String _nombre;

  Perro(this._nombre, this.peso);

  @override
  String get nombre => 'Perro: $_nombre';

  @override
  double calcularCostoAtencion() => 35.00 + (peso * 0.5);
}

class Gato extends Mascota {
  final bool esDeInterior;
  final String _nombre;

  Gato(this._nombre, this.esDeInterior);

  @override
  String get nombre => 'Gato: $_nombre';

  @override
  double calcularCostoAtencion() => esDeInterior ? 30.00 : 35.00;
}

class Ave extends Mascota {
  final String _nombre;

  Ave(this._nombre);

  @override
  String get nombre => 'Ave: $_nombre';

  @override
  double calcularCostoAtencion() => 25.00;
}

void imprimirCosto(Mascota mascota) {
  print('${mascota.nombre}: \$${mascota.calcularCostoAtencion().toStringAsFixed(2)}');
}

void main() {
  final pacientes = <Mascota>[
    Perro('Roco', 12.0),
    Gato('Luna', true),
    Ave('Tito'),
  ];

  for (final p in pacientes) {
    imprimirCosto(p);
  }

  final mayor = pacientes.reduce((a, b) => a.calcularCostoAtencion() > b.calcularCostoAtencion() ? a : b);
  print('\nConsulta mas costosa: ${mayor.nombre}');
}