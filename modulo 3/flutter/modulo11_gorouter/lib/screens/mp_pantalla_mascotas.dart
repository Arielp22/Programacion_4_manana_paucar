// lib/screens/mp_pantalla_mascotas.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter/models/mp_mascota.dart';

class MpPantallaMascotas extends StatelessWidget {
  const MpPantallaMascotas({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final mascotas = mascotasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Mascotas'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount:   mascotas.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(Icons.pets, color: mascotas[i].vacunado ? Colors.green : Colors.grey),
          title:   Text(mascotas[i].nombre),
          subtitle: Text('${mascotas[i].especie} - dueno: ${mascotas[i].dueno}'),
          onTap: () {
            context.push(
             '/mascotas/${mascotas[i].id}',
             extra: mascotas[i],
            );
          },
        ),
      ),
    );
  }
}