// lib/screens/mp_scaffold_con_nav.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MpScaffoldConNav extends StatelessWidget {
  final Widget child;
  const MpScaffoldConNav({super.key, required this.child});

  int _indiceActivo(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    if (loc.startsWith('/metricas')) return 1;
    if (loc.startsWith('/ajustes'))  return 2;
    if (loc.startsWith('/Dashboard')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indiceActivo(context),
        onDestinationSelected: (i) {
          switch (i) {
            case 0: context.go('/mascotas');
            case 1: context.go('/metricas');
            case 2: context.go('/ajustes');
            case 3: context.go('/Dashboard');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets),
            label: 'Mascotas',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart),
            label: 'Metricas',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}