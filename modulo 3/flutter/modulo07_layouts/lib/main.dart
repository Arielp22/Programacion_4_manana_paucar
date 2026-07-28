// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo07_layouts/mp_customized_size_box.dart';
import 'package:modulo07_layouts/widgets/mp_avatar_badge.dart';
import 'package:modulo07_layouts/widgets/mp_fila_estado.dart';
import 'package:modulo07_layouts/widgets/mp_tarjeta_log.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este numero y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoracion y espaciado                  │
// │  2  Paso 2  Column — MpTarjetaLog                               │
// │  3  Paso 3  Row + Expanded + Spacer — MpFilaEstado              │
// │  4  Paso 4  Stack + Positioned — MpAvatarBadge                  │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _mpPaso1(),
    2 => Scaffold(
      body: ListView(
        children: [
          MpTarjetaLog(nivel: 'EMERGENCIA', mascota: 'Max',
              diagnostico:   'Fiebre alta - requiere atencion inmediata',
              timestamp: DateTime.now()),
          MpTarjetaLog(nivel: 'OBSERVACION',  mascota: 'Luna',
              diagnostico:   'Vacuna pendiente - reprogramar',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          MpTarjetaLog(nivel: 'CONSULTA',  mascota: 'Rocky',
              diagnostico:   'Control de rutina completado',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          MpTarjetaLog(nivel: 'VACUNA', mascota: 'Piolin',
              diagnostico:   'Vacuna antigripal aplicada',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          MpFilaEstado(nombre: 'Max',   detalle: 'Labrador · 3 anios',          activo: true),
          Divider(height: 1),
          MpFilaEstado(nombre: 'Luna',    detalle: 'Siames · 5 anios',           activo: true),
          Divider(height: 1),
          MpFilaEstado(nombre: 'Rocky', detalle: 'Bulldog · en observacion', activo: false),
          Divider(height: 1),
          MpFilaEstado(nombre: 'Piolin',
                     detalle: 'Canario · 1 anio', activo: true),
        ],
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MpAvatarBadge(nombre: 'Max', alertas: 2,  activo: true),
            SizedBox(width: 24),
            MpAvatarBadge(nombre: 'Luna',  alertas: 0,  activo: true),
            SizedBox(width: 24),
            MpAvatarBadge(nombre: 'Rocky', alertas: 0,  activo: false),
            SizedBox(width: 24),
            MpAvatarBadge(nombre: 'Piolin',  alertas: 11, activo: true),
            SizedBox(width: 24),
            MpAvatarBadge(nombre: 'Copito',  alertas: 11, activo: true),
          ],
        ),
      ),
    ),
    5 => Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MpCustomizedSizeBox()
        ],
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

Widget _mpPaso1() => Scaffold(
  body: Center(
    child: Container(
      width: double.infinity,
      height:  80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:        Colors.green.shade50,
        borderRadius: BorderRadius.circular(40),
        border:       Border(left: BorderSide(color: Colors.green, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Max - Labrador',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);