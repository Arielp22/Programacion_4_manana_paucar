// lib/widgets/mp_fila_mascota.dart
import 'package:flutter/material.dart';
import '../models/mp_mascota.dart';

class MpFilaMascota extends StatelessWidget {
  final MpMascota  mascota;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const MpFilaMascota({
    super.key,
    required this.mascota,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: mascota.favorito
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.pets,
          color: mascota.favorito ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        mascota.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${mascota.especie} - ${mascota.raza} - dueno: ${mascota.dueno}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              mascota.favorito ? Icons.star : Icons.star_border,
              color: mascota.favorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       mascota.favorito ? 'Quitar favorito' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}