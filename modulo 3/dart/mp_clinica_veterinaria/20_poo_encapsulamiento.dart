class HistoriaClinica {
  final String mascota;
  double _peso;

  HistoriaClinica(this.mascota, double pesoInicial) : _peso = pesoInicial;

  double get peso => _peso;

  void registrarPeso(double monto) {
    if (monto <= 0) throw ArgumentError('El peso debe ser positivo');
    _peso += monto; // aquí monto puede considerar ganancia, simplificado
    print('Registro de peso: $monto. Nuevo peso: $_peso');
  }

  void ajustarPeso(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    if (monto > _peso) throw StateError('Ajuste inválido');
    _peso -= monto;
    print('Ajuste de peso: $monto. Nuevo peso: $_peso');
  }
}

void main() {
  final historia = HistoriaClinica('Luna', 5.0);

  historia.registrarPeso(0.5);
  historia.ajustarPeso(0.2);
  print(historia.peso);
}
