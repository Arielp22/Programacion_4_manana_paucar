// lib/router/mp_approuterpaso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/mp_pantalla_inicio.dart';
import '../screens/mp_pantalla_mascotas.dart';
import '../screens/mp_pantalla_detalle.dart';
import '../models/mp_mascota.dart';

final mpAppRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const MpPantallaInicio(),
    ),
    GoRoute(
      path:    '/mascotas',
      builder: (context, state) => const MpPantallaMascotas(),
      routes: [
        GoRoute(
          path:    ':id',
          builder: (context, state) {
            final id      = state.pathParameters['id']!;
            final mascota = state.extra as MpMascota?;
            return MpPantallaDetalle(id: id, mascota: mascota);
          },
        ),
        GoRoute(
          path:    ':id/historial',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Historial de $id')),
              body:   Center(child: Text('Historial de la mascota $id')),
            );
          },
        ),
      ],
    ),
  ],
);