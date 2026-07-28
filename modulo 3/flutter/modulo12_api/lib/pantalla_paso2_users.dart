import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modulo12_api/dto_user.dart';


class PantallaPaso2User extends StatelessWidget {
  const PantallaPaso2User({super.key});

  Future<List<UserDto>> _fetchUsers() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<UserDto>>(
        future: _fetchUsers(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final users = snap.data!;
          return Column(
            children: [
              // Resumen con chips
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${users.where((t) => t.website).length} completadas'),
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${users.where((t) => !t.website).length} pendientes'),
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),
              
              // Lista de users
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, i) {
                    final t = users[i];
                    return CheckboxListTile(
                      title: Text(t.name),
                      subtitle: Text('email: ${t.email}'),
                      value: t.website,
                      onChanged: null, // solo lectura por ahora
                      activeColor: Colors.green,
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