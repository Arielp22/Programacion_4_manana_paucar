import 'package:flutter/material.dart';

class MpCustomizedSizeBox extends StatelessWidget {
  const MpCustomizedSizeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Mascota: Max'),
        const SizedBox(height: 32),
        const Text('Especie: Perro (despues de 32px)'),
        const Divider(height: 32),
        const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          color: Colors.green.shade50,
          child: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text('Texto con Padding izquierdo - Vet AP'),
          ),
        ),
        const Divider(height: 32),
        const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.pets, color: Colors.green),
        ),
        const Divider(height: 32),
        const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing:    8,
          runSpacing: 8,
          children: ['Perro', 'Gato', 'Ave', 'Conejo', 'Hamster', 'Pez', 'Tortuga']
              .map((t) => Chip(label: Text(t)))
              .toList(),
        ),
      ],
    );
  }
}