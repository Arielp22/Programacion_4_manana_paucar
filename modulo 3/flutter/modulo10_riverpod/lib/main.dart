// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/mp_pantalla_busqueda.dart';
import 'screens/mp_pantalla_metricas.dart';
import 'screens/mp_pantalla_mascotas.dart';
import 'screens/mp_pantalla_dashboard.dart';

const int paso = 5;

final contadorProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: MpAppVet()));
}

class MpAppVet extends StatelessWidget {
  const MpAppVet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D6A4F)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _MpPaso1(),
        2 => const MpPantallaMascotas(),
        3 => const MpPantallaBusqueda(),
        4 => const MpPantallaMetricas(),
        5 => const MpPantallaDashboard(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class _MpPaso1 extends ConsumerWidget {
  const _MpPaso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mascotas en la clinica')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('mascotas registradas'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}