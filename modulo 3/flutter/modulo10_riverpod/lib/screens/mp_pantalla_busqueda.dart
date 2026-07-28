// lib/screens/mp_pantalla_busqueda.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mp_mascotas_provider.dart';

class MpPantallaBusqueda extends ConsumerWidget {
  const MpPantallaBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mascotas = ref.watch(mpMascotasFiltradosProvider);
    final busqueda = ref.watch(mpBusquedaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar mascotas')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            hintText: 'Buscar por nombre, especie o dueno...',
            leading:  const Icon(Icons.search),
            trailing: busqueda.isNotEmpty
                ? [IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () =>
                        ref.read(mpBusquedaProvider.notifier).state = '',
                  )]
                : null,
            onChanged: (v) =>
                ref.read(mpBusquedaProvider.notifier).state = v,
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        Expanded(
          child: mascotas.isEmpty
              ? const Center(child: Text('Sin resultados'))
              : ListView.builder(
                  itemCount:   mascotas.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.pets),
                    title:    Text(mascotas[i].nombre),
                    subtitle: Text('${mascotas[i].especie} - ${mascotas[i].dueno}'),
                  ),
                ),
        ),
      ]),
    );
  }
}