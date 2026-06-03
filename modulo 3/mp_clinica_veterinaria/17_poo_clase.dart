class EquipoMedico {
  final String id;
  final String nombre;
  String ubicacion;
  bool _activo = false;

  EquipoMedico({
    required this.id,
    required this.nombre,
    required this.ubicacion,
  });

  bool get activo => _activo;
  String get estado => _activo ? 'operativo' : 'inoperativo';

  set estadoActivo(bool valor) {
    _activo = valor;
    print('$nombre: ${valor ? "operativo" : "apagado"}');
  }

  void conectar() {
    _activo = true;
    print('$nombre conectado en $ubicacion');
  }

  void desconectar() {
    _activo = false;
    print('$nombre desconectado');
  }

  String resumen() => 'ID: $id | Nombre: $nombre | Ubicación: $ubicacion | Estado: $estado';

  @override
  String toString() => 'EquipoMedico($nombre, $ubicacion, $estado)';
}

void main() {
  final ecografo = EquipoMedico(
    id: 'EQ-001',
    nombre: 'ecografo-1',
    ubicacion: 'Consultorio 2',
  );

  ecografo.conectar();
  print(ecografo.estado);
  print(ecografo.resumen());
  print(ecografo);

  ecografo.estadoActivo = false;
  print(ecografo.activo);
}
