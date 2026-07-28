void main() {
  final examenes = ['Rx', 'Ecografia', 'Analisis', 'Vacunacion'];

  for (final examen in examenes) {
    print(examen);
  }

  examenes.forEach((e) => print(e.toLowerCase()));

  final puertos = {'Rx': 1, 'Ecografia': 2, 'Analisis': 3, 'Vacunacion': 4};
  for (final entrada in puertos.entries) {
    print('${entrada.key} → código ${entrada.value}');
  }

  for (final caracter in 'Clinica'.split('')) {
    print(caracter);
  }
}