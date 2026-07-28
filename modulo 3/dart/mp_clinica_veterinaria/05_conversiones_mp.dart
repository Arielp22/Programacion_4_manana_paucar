void main() {
  int entero = 42;
  double decimal = entero.toDouble();
  String texto = entero.toString();

  int num1 = int.parse('123');
  double num2 = double.parse('3.14');

  int? num3 = int.tryParse('abc');
  double? num4 = double.tryParse('99');

  Object valor = 'historiaClinica';
  if (valor is String) {
    print(valor.length);
  }

  Object obj = 'Hola';
  String str = obj as String;

  String? nullable = null;
  int longitud = nullable?.length ?? 0;
  print(longitud);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}
