// lib/screens/mp_pantalla_inicio.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MpPantallaInicio extends StatelessWidget {
  const MpPantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Vet AP'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.pets, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            const Text('Clinica Veterinaria Vet AP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Gestiona tus mascotas',
                style: TextStyle(color: cs.onSurfaceVariant)),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/mascotas'),
              icon:  const Icon(Icons.pets),
              label: const Text('Ver mascotas'),
            ),
          ],
        ),
      ),
    );
  }
}