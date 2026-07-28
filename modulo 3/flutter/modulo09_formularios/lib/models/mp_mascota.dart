// lib/models/mp_mascota.dart
class MpMascota {
  final String id;
  final String nombre;
  final String especie;
  final String raza;
  final int    edad;
  final String dueno;
  final String telefono;
  bool         favorito;

  MpMascota({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.raza,
    required this.edad,
    required this.dueno,
    required this.telefono,
    this.favorito = false,
  });
}