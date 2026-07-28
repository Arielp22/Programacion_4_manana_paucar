class MpCitaDto {
  final int id;
  final String mascota;
  final String dueno;
  final String motivo;
  final bool atendida;

  const MpCitaDto({
    required this.id,
    required this.mascota,
    required this.dueno,
    required this.motivo,
    required this.atendida,
  });

  factory MpCitaDto.fromJson(Map<String, dynamic> json) => MpCitaDto(
    id:       json['id']       as int,
    mascota:  json['mascota']  as String,
    dueno:    json['dueno']    as String,
    motivo:   json['motivo']   as String,
    atendida: json['atendida'] as bool,
  );
}