class MpMascota {
  final String id;
  final String nombre;
  final String especie;
  final String dueno;
  final bool   vacunado;

  const MpMascota({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.dueno,
    required this.vacunado,
  });
}

const mascotasSimuladas = [
  MpMascota(id: '1', nombre: 'Max',  especie: 'Perro', dueno: 'Carlos Perez', vacunado: true),
  MpMascota(id: '2', nombre: 'Luna', especie: 'Gato',  dueno: 'Ana Gomez',    vacunado: true),
  MpMascota(id: '3', nombre: 'Rocky',especie: 'Perro', dueno: 'Luis Torres',  vacunado: false),
];