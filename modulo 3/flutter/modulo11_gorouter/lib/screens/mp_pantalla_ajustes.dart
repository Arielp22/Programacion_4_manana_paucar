// mp_pantalla_ajustes.dart
import 'package:flutter/material.dart';

class MpPantallaAjustes extends StatelessWidget {
  const MpPantallaAjustes({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.settings, size: 56),
        SizedBox(height: 8),
        Text('Ajustes de Vet AP', style: TextStyle(fontSize: 18)),
      ],
    )),
  );
}