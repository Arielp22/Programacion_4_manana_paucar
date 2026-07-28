// lib/router/mp_approuterpaso4.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/mp_scaffold_con_nav.dart';
import '../screens/mp_pantalla_mascotas.dart';
import '../screens/mp_pantalla_detalle.dart';
import '../screens/mp_pantalla_metricas.dart';
import '../screens/mp_pantalla_ajustes.dart';
import '../models/mp_mascota.dart';
import '../screens/mp_pantalla_dashboard.dart';

final mpAppRouterPaso4 = GoRouter(
  initialLocation: '/mascotas',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) => MpScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/mascotas',
          builder: (_, __) => const MpPantallaMascotas(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id      = state.pathParameters['id']!;
                final mascota = state.extra as MpMascota?;
                return MpPantallaDetalle(id: id, mascota: mascota);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (_, __) => const MpPantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const MpPantallaAjustes(),
        ),
        GoRoute(
          path:    '/Dashboard',
          builder: (_, __) => const MpPantallaDashboard(),
        ),
      ],
    ),
  ],
);