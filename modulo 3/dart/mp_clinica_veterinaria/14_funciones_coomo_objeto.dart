int doblar(int n)  => n * 2;
int triplicar(int n) => n * 3;

void main() {
  int Function(int) operacion;

  operacion = doblar;
  print(operacion(5));

  operacion = triplicar;
  print(operacion(5));

  final transformaciones = <int Function(int)>[doblar, triplicar];
  for (final fn in transformaciones) {
    print(fn(10));
  }
}
