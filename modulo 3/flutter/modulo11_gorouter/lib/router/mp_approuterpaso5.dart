// lib/router/mp_approuterpaso5.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/mp_auth_provider.dart';
import '../screens/mp_scaffold_con_nav.dart';
import '../screens/mp_pantalla_mascotas.dart';
import '../screens/mp_pantalla_detalle.dart';
import '../screens/mp_pantalla_metricas.dart';
import '../screens/mp_pantalla_ajustes.dart';
import '../screens/mp_pantalla_login.dart';
import '../models/mp_mascota.dart';
import '../screens/mp_pantalla_dashboard.dart';

GoRouter mpAppRouterPaso5(WidgetRef ref) => GoRouter(
  initialLocation: '/mascotas',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    final authState     = ref.read(mpAuthProvider);
    final autenticado   = authState is MpAutenticado;
    final enLogin       = state.matchedLocation == '/login';

    if (!autenticado && !enLogin) return '/login';
    if (autenticado && enLogin)   return '/mascotas';
    return null;
  },
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
              builder: (context, state) => MpPantallaDetalle(
                id:       state.pathParameters['id']!,
                mascota: state.extra as MpMascota?,
              ),
            ),
          ],
        ),
        GoRoute(path: '/metricas', builder: (_, __) => const MpPantallaMetricas()),
        GoRoute(path: '/ajustes',  builder: (_, __) => const MpPantallaAjustes()),
        GoRoute(path: '/Dashboard', builder: (_, __) => const MpPantallaDashboard()),
      ],
    ),
    GoRoute(
      path:    '/login',
      builder: (_, __) => const MpPantallaLogin(),
    ),
  ],
);