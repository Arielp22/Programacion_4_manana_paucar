void main() {
  // List — lista de mascotas
  List<String> mascotas = ['Rex', 'Luna', 'Misu'];
  var numeros = [1, 2, 3, 4, 5];

  print(mascotas[0]);
  print(mascotas.length);
  mascotas.add('Bobby');
  mascotas.remove('Misu');

  // Map — nombre -> edad (mascotas)
  Map<String, int> edades = {
    'Rex': 3,
    'Luna': 2,
    'Misu': 5,
  };

  print(edades['Rex']);
  print(edades['Toby']);
  edades['Bobby'] = 1;

  // Set — servicios ofrecidos
  Set<String> servicios = {'consulta', 'vacunacion', 'cirugia'};
  servicios.add('consulta');
  print(servicios.length);

  var lista1 = [1, 2, 3];
  var lista2 = [4, 5, 6];
  var combinada = [...lista1, ...lista2];
  print(combinada);

  bool mostrarExtra = true;
  var items = [
    'consulta',
    'vacuna',
    if (mostrarExtra) 'desparasitación',
  ];

  var cuadrados = [for (var i = 1; i <= 5; i++) i * i];
  print(cuadrados);
}
