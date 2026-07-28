// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/mp_auth_provider.dart';
import 'router/mp_app_router.dart';
import 'router/mp_approuterpaso2.dart';
import 'router/mp_approuterpaso3.dart';
import 'router/mp_approuterpaso4.dart';
import 'router/mp_approuterpaso5.dart';

const int paso = 5;

void main() => runApp(const ProviderScope(child: MpAppVet(paso: paso)));

class MpAppVet extends ConsumerWidget {
  final int paso;
  const MpAppVet({super.key, required this.paso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mpAuthProvider);

    final router = switch (paso) {
      1 => mpAppRouter,
      2 => mpAppRouterPaso2,
      3 => mpAppRouterPaso3,
      4 => mpAppRouterPaso4,
      5 => mpAppRouterPaso5(ref),
      _ => mpAppRouter,
    };

    return MaterialApp.router(
      title:        'Vet AP',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D6A4F)),
        useMaterial3: true,
      ),
    );
  }
}