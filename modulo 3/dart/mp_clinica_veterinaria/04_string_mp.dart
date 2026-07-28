void main() {
  final mascota = 'Rex';
  final edad    = 3;

  print('Hola, $mascota');
  print('${mascota.toUpperCase()} tiene ${edad + 1} años el próximo año');

  final ficha = '''
Nombre: $mascota
Edad:   $edad
Vacunas: Sí
  ''';
  print(ficha);

  final ruta = r'C:\Clinica\Registros';
  print(ruta);

  final saludo = 'Hola, ' + mascota + '!';

  print('veterinaria'.toUpperCase());
  print('  Veterinaria  '.trim());
  print('Veterinaria'.contains('tar'));
  print('Veterinaria'.replaceAll('t', 'T'));
  print('a,b,c'.split(','));
  print('Veterinaria'.substring(0, 4));
  print('Veterinaria'.startsWith('Vet'));
  print('abc'.padLeft(5, '0'));
}
