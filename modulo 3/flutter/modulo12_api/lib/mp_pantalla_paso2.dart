import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'mp_cita_dto.dart';

class MpPantallaPaso2 extends StatelessWidget {
  const MpPantallaPaso2({super.key});

  Future<List<MpCitaDto>> _fetchCitas() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista.asMap().entries.map((e) {
      final item = e.value as Map<String, dynamic>;
      final mascotas = ['Max', 'Luna', 'Rocky', 'Piolin', 'Copito'];
      final duenos = ['Carlos Perez', 'Ana Gomez', 'Luis Torres', 'Maria Diaz', 'Sofia Ruiz'];
      final i = e.key % 5;
      return MpCitaDto(
        id:       item['id'] as int,
        mascota:  mascotas[i],
        dueno:    duenos[i],
        motivo:   item['title'] as String,
        atendida: item['completed'] as bool,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · Lista de citas'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<MpCitaDto>>(
        future: _fetchCitas(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final citas = snap.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${citas.where((c) => c.atendida).length} atendidas'),
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${citas.where((c) => !c.atendida).length} pendientes'),
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: citas.length,
                  itemBuilder: (context, i) {
                    final c = citas[i];
                    return ListTile(
                      leading: Icon(Icons.pets,
                          color: c.atendida ? Colors.green : Colors.orange),
                      title: Text('${c.mascota} - ${c.dueno}'),
                      subtitle: Text(c.motivo),
                      trailing: Chip(
                        label: Text(
                          c.atendida ? 'Atendida' : 'Pendiente',
                          style: const TextStyle(fontSize: 11),
                        ),
                        backgroundColor: c.atendida
                            ? Colors.green[100]
                            : Colors.orange[100],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}