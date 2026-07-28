class MpMetricaVet {
  final String mascota;
  final double temperatura;
  final double peso;
  final int    ppm; // pulsaciones por minuto
  final String estado;

  const MpMetricaVet({
    required this.mascota,
    required this.temperatura,
    required this.peso,
    required this.ppm,
    required this.estado,
  });
}