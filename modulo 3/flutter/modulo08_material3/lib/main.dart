// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/mp_pantalla_tema.dart';
import 'screens/mp_pantalla_appbar.dart';
import 'widgets/mp_catalogo_botones.dart';
import 'screens/mp_pantalla_navegacion.dart';
import 'screens/mp_pantalla_dialogs.dart';

const int paso = 6;

void main() => runApp(const MpAppVet());

class MpAppVet extends StatefulWidget {
  const MpAppVet({super.key});
  @override
  State<MpAppVet> createState() => _MpAppVetState();
}

class _MpAppVetState extends State<MpAppVet> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF2D6A4F);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _MpPaso1(),
        2 => MpPantallaTema(
               themeMode: _themeMode,
               onToggle:  (mode) => setState(() => _themeMode = mode),
             ),
        3 => const MpPantallaAppBar(),
        4 => const MpCatalogoBotones(),
        5 => const MpPantallaNavegacion(),
        6 => const MpPantallaDialogs(),
        _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
      },
    );
  }
}

class _MpPaso1 extends StatelessWidget {
  const _MpPaso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Vet AP - Clinica Veterinaria'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.pets, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Max - Labrador',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Dueno: Carlos Perez · Edad: 3 anios',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.medical_services),
              label: const Text('Iniciar consulta'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}