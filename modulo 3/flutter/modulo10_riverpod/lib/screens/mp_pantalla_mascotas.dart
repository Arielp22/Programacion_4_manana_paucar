// lib/screens/mp_pantalla_mascotas.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mp_mascotas_provider.dart';
import '../models/mp_mascota.dart';

class MpPantallaMascotas extends ConsumerWidget {
  const MpPantallaMascotas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mascotas = ref.watch(mpMascotasProvider);
    final cs       = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: mascotas.isEmpty
          ? const Center(child: Text('Sin mascotas'))
          : ListView.separated(
              itemCount:        mascotas.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final m = mascotas[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: m.vacunado
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.pets,
                        color: m.vacunado ? Colors.green : Colors.grey),
                  ),
                  title:    Text(m.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${m.especie} - dueno: ${m.dueno}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          m.favorito ? Icons.star : Icons.star_border,
                          color: m.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(mpMascotasProvider.notifier)
                            .toggleFavorito(m.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(mpMascotasProvider.notifier)
                            .eliminar(m.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(mpMascotasProvider.notifier).agregar(
            MpMascota(
              id:      id,
              nombre:  'nueva-mascota-$id',
              especie: 'Perro',
              dueno:   'Pendiente',
              edad:    1,
              vacunado: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}