// lib/models/mp_mascota.dart
class MpMascota {
  final String id;
  final String nombre;
  final String especie;
  final String dueno;
  final int    edad;
  final bool   vacunado;
  bool         favorito;

  MpMascota({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.dueno,
    required this.edad,
    required this.vacunado,
    this.favorito = false,
  });
}