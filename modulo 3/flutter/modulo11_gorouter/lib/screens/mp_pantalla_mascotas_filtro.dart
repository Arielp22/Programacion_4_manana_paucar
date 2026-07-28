// lib/screens/mp_pantalla_mascotas_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/mp_mascota.dart';

class MpPantallaMascotasFiltro extends StatelessWidget {
  final bool soloVacunados;
  const MpPantallaMascotasFiltro({super.key, this.soloVacunados = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloVacunados
        ? mascotasSimuladas.where((m) => m.vacunado).toList()
        : mascotasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Mascotas${soloVacunados ? ' (Vacunados)' : ''}'),
        actions: [
          IconButton(
            icon:    Icon(soloVacunados ? Icons.vaccines : Icons.vaccines_outlined),
            tooltip: soloVacunados ? 'Ver todos' : 'Solo vacunados',
            onPressed: () => soloVacunados
                ? context.go('/mascotas')
                : context.go('/mascotas?soloVacunados=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final m = filtrados[i];
          return ListTile(
            leading: Icon(Icons.pets, color: m.vacunado ? Colors.green : Colors.grey),
            title:   Text(m.nombre),
            subtitle: Text('${m.especie} - dueno: ${m.dueno}'),
            onTap: () => context.push(
              '/mascotas/${m.id}',
              extra: m,
            ),
          );
        },
      ),
    );
  }
}