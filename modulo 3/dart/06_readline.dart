import 'dart:io';


void main() {
  print('Ingrese su nombre:');
  String? nombre = stdin.readLineSync();
  print('Hola $nombre');


  print('Ingrese un número entero:');
  int numero = int.parse(stdin.readLineSync()!);
  print('Número: $numero');


  print('Ingrese un decimal:');
  double valor = double.parse(stdin.readLineSync()!);
  print('Valor: $valor');


  print('Ingrese el primer número:');
  int a = int.parse(stdin.readLineSync()!);


  print('Ingrese el segundo número:');
  int b = int.parse(stdin.readLineSync()!);


  int suma = a + b;


  print('La suma es: $suma');
}


