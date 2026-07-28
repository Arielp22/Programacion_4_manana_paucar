// lib/router/mp_approuterpaso3.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/mp_pantalla_inicio.dart';
import '../screens/mp_pantalla_mascotas_filtro.dart';
import '../screens/mp_pantalla_detalle.dart';
import '../models/mp_mascota.dart';

final mpAppRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const MpPantallaInicio(),
    ),
    GoRoute(
      path:    '/mascotas',
      builder: (context, state) {
        final soloVacunados = state.uri.queryParameters['soloVacunados'] == 'true';
        return MpPantallaMascotasFiltro(soloVacunados: soloVacunados);
      },
    ),
    GoRoute(
      path:    '/mascotas/:id',
      builder: (context, state) {
        final id      = state.pathParameters['id']!;
        final mascota = state.extra as MpMascota?;
        return MpPantallaDetalle(id: id, mascota: mascota);
      },
    ),
  ],
);