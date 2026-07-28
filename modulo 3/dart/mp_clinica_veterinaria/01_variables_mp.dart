void main() {
  // var — tipo inferido
  var mascota = 'Firulais';      // String
  var edad    = 4;               // int
  var precio  = 89.99;           // double (ej. consulta)
  var activo  = true;            // bool

  // Tipo explícito
  String especie = 'Perro';
  int    stock    = 100;
  double pi       = 3.14159;
  bool   visible  = false;

  // final — no se puede reasignar
  final clinica = 'Clínica Central';

  // const — constante en tiempo de compilación
  const gravedad = 9.8;

  print('$mascota $especie tiene $edad años en $clinica');

  var contador = 0;
  contador = 1;          // OK
  print('Turno: $contador');

  final vacunas = ["Moquillo", "Parvovirus", "Rabia"];
  vacunas.add('Leptospirosis');
  print('Vacunas: $vacunas');

  const collares = ['azul', 'rojo'];
  print('Colores de collar: $collares');
}
