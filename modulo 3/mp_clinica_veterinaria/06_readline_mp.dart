import 'dart:io';

void main() {
  print('Ingrese nombre de la mascota:');
  String? nombre = stdin.readLineSync();
  print('Hola $nombre');

  print('Ingrese edad de la mascota (entero):');
  int numero = int.parse(stdin.readLineSync()!);
  print('Edad: $numero');

  print('Ingrese peso (decimal):');
  double valor = double.parse(stdin.readLineSync()!);
  print('Peso: $valor');

  print('Ingrese el primer número:');
  int a = int.parse(stdin.readLineSync()!);

  print('Ingrese el segundo número:');
  int b = int.parse(stdin.readLineSync()!);

  int suma = a + b;
  print('La suma es: $suma');
}
