// lib/widgets/mp_tarjeta_mascota_grid.dart
import 'package:flutter/material.dart';
import '../models/mp_mascota.dart';

class MpTarjetaMascotaGrid extends StatelessWidget {
  final MpMascota  mascota;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const MpTarjetaMascotaGrid({
    super.key,
    required this.mascota,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(
                Icons.pets,
                color: mascota.favorito ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  mascota.favorito ? Icons.star : Icons.star_border,
                  color: mascota.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Text(
              mascota.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              mascota.especie,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const Spacer(),
            Row(children: [
              if (mascota.favorito)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.star, size: 12, color: Colors.amber),
                ),
              Expanded(
                child: Text(
                  '${mascota.edad} anios',
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}