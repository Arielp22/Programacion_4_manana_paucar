import 'package:flutter/material.dart';

class MpTarjetaLog extends StatelessWidget {
  final String   nivel;
  final String   mascota;
  final String   diagnostico;
  final DateTime timestamp;

  const MpTarjetaLog({
    super.key,
    required this.nivel,
    required this.mascota,
    required this.diagnostico,
    required this.timestamp,
  });

  Color get _colorNivel => switch (nivel) {
    'CONSULTA' => Colors.blue,
    'VACUNA'   => Colors.green,
    'OBSERVACION' => Colors.orange,
    'EMERGENCIA' => Colors.red,
    _       => Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:        _colorNivel.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border:       Border(left: BorderSide(color: _colorNivel, width: 6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: _colorNivel, borderRadius: BorderRadius.circular(4)),
                child: Text(nivel,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Text(mascota,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
              const Spacer(),
              Text(
                '${timestamp.hour.toString().padLeft(2, '0')}:'
                '${timestamp.minute.toString().padLeft(2, '0')}:'
                '${timestamp.second.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(diagnostico, style: TextStyle(fontSize: 13, color: Colors.grey.shade800)),

          Row(children: [
            Icon(Icons.pets),
            Expanded(child: Text('Mascota registrada en Vet AP')),
            Text('Vacunado'),
          ]),

          Row(children: [
            Text('Estado'),
            const Spacer(),
            Icon(Icons.circle, color: Colors.green, size: 12),
          ])
        ],
      ),
    );
  }
}