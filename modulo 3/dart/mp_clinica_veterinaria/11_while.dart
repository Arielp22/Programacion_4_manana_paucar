import 'dart:io';

void main() {
  int paquetes = 0;
  int buffer   = 1024;

  while (buffer > 0) {
    final tamano = buffer > 256 ? 256 : buffer;
    paquetes++;
    buffer -= tamano;
    print('Paquete $paquetes: $tamano bytes (restante: $buffer)');
  }

  int reintentos = 0;
  bool conexionEstablecida = false;

  do {
    reintentos++;
    print('Intento de conexión #$reintentos...');
    if (reintentos == 3) conexionEstablecida = true;
  } while (!conexionEstablecida && reintentos < 5);

  print(conexionEstablecida
      ? 'Conectado tras $reintentos intentos'
      : 'No se pudo conectar');
}

void main2() {
    int totalCajas = 0;
    int empleados = 0;
    int cajas = -1; 
    
    while (cajas != 0) {
    print('ingrese la cantidad de cajas (0 para salir):');
    cajas = int.parse(stdin.readLineSync() ?? '0');

    if (cajas > 0) {
      if (cajas < 20) {
        print('rendimiento bajo');
      } else if (cajas <= 50) {
        print('rendimiento normal');
      } else {
        print('rendimiento excelente');
      }

      totalCajas += cajas;
      empleados++;
    }
  }

  print('total de cajas: $totalCajas');
  print('empleados registrados: $empleados');
  
  if (empleados > 0) {
    print('promedio: ${totalCajas / empleados}');
  } else {
    print('promedio: 0');
  }
}
