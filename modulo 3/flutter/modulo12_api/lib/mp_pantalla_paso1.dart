import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class MpPantallaPaso1 extends StatelessWidget {
  const MpPantallaPaso1({super.key});

  Future<Map<String, dynamic>> _fetchCita() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    );
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    // Adaptamos los datos de la API a contexto veterinario
    return {
      'id': data['id'],
      'mascota': 'Max',
      'dueno': 'Carlos Perez',
      'motivo': data['title'],
      'atendida': data['completed'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 1 · Cita individual'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchCita(),
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            if (snap.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text('Error: ${snap.error}',
                      style: const TextStyle(color: Colors.red)),
                ],
              );
            }
            final cita = snap.data!;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.pets, size: 48, color: Colors.green),
                  const SizedBox(height: 16),
                  Text('ID: ${cita['id']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(
                    cita['mascota'] as String,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dueño: ${cita['dueno']}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Text(cita['motivo'] as String,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text(
                      (cita['atendida'] as bool) ? 'Atendida' : 'Pendiente',
                    ),
                    backgroundColor: (cita['atendida'] as bool)
                        ? Colors.green[100]
                        : Colors.orange[100],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}