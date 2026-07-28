// lib/screens/mp_pantalla_detalle.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/mp_mascota.dart';

class MpPantallaDetalle extends StatelessWidget {
  final String     id;
  final MpMascota? mascota;

  const MpPantallaDetalle({super.key, required this.id, this.mascota});

  @override
  Widget build(BuildContext context) {
    final m = mascota ??
        mascotasSimuladas.where((s) => s.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Detalle: ${m?.nombre ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: m == null
          ? Center(child: Text('Mascota $id no encontrada'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MpFila('ID',       m.id),
                  _MpFila('Nombre',   m.nombre),
                  _MpFila('Especie',  m.especie),
                  _MpFila('Dueno',    m.dueno),
                  _MpFila('Vacunado', m.vacunado ? 'Si' : 'No'),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/mascotas/${m.id}/historial'),
                      icon:  const Icon(Icons.history),
                      label: const Text('Ver historial'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _MpFila extends StatelessWidget {
  final String label;
  final String valor;
  const _MpFila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 80,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}