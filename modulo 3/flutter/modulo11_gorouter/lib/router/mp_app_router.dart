// lib/router/mp_app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/mp_pantalla_inicio.dart';
import '../screens/mp_pantalla_mascotas.dart';

final mpAppRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      name:    'inicio',
      builder: (context, state) => const MpPantallaInicio(),
    ),
    GoRoute(
      path:    '/mascotas',
      name:    'mascotas',
      builder: (context, state) => const MpPantallaMascotas(),
    ),
  ],
);