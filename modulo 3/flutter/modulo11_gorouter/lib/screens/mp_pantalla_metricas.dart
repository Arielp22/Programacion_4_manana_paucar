// mp_pantalla_metricas.dart
import 'package:flutter/material.dart';

class MpPantallaMetricas extends StatelessWidget {
  const MpPantallaMetricas({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.bar_chart, size: 56),
        SizedBox(height: 8),
        Text('Metricas veterinarias', style: TextStyle(fontSize: 18)),
      ],
    )),
  );
}