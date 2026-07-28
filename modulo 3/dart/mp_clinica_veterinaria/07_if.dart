void main() {
  int temperatura = 39; // temperatura de la mascota

  if (temperatura > 39) {
    print('Fiebre alta');
  } else if (temperatura > 37.5) {
    print('Fiebre');
  } else if (temperatura > 36) {
    print('Normal');
  } else {
    print('Hipotermia');
  }

  String estado = temperatura > 39 ? 'Con fiebre alta' : 'Sin fiebre alta';
  print(estado);

  String? clinica;
  String display = clinica != null ? clinica.toUpperCase() : 'Sin clínica';
  String display2 = clinica?.toUpperCase() ?? 'Sin clínica';
  print(display2);
}

void main2() {
  String? nombre;

  if (nombre != null) {
    print(nombre.length);
  }

  print(nombre?.length);

  int longitud = nombre?.length ?? 0;
  print(longitud);
}
