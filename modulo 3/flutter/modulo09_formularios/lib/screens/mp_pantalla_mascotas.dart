// lib/screens/mp_pantalla_mascotas.dart
import 'package:flutter/material.dart';
import '../models/mp_mascota.dart';
import '../widgets/mp_fila_mascota.dart';
import '../widgets/mp_tarjeta_mascota_grid.dart';

class MpPantallaMascotas extends StatefulWidget {
  const MpPantallaMascotas({super.key});
  @override
  State<MpPantallaMascotas> createState() => _MpPantallaMascotasState();
}

class _MpPantallaMascotasState extends State<MpPantallaMascotas> {
  final _mascotas = [
    MpMascota(id:'1', nombre:'Max',  especie:'Perro', raza:'Labrador',    edad:3, dueno:'Carlos Perez', telefono:'0991234567', favorito:true),
    MpMascota(id:'2', nombre:'Luna', especie:'Gato',  raza:'Siames',      edad:5, dueno:'Ana Gomez',    telefono:'0987654321'),
    MpMascota(id:'3', nombre:'Rocky',especie:'Perro', raza:'Bulldog',     edad:2, dueno:'Luis Torres',  telefono:'0976543210'),
    MpMascota(id:'4', nombre:'Piolin',especie:'Ave',  raza:'Canario',     edad:1, dueno:'Maria Diaz',   telefono:'0965432109'),
  ];

  bool _modoGrid = false;

  void _toggleFavorito(int i) =>
      setState(() => _mascotas[i].favorito = !_mascotas[i].favorito);

  void _eliminar(int i) => setState(() => _mascotas.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${_mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadricula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _mascotas.length,
              itemBuilder: (ctx, i) => MpTarjetaMascotaGrid(
                mascota:   _mascotas[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _mascotas.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => MpFilaMascota(
                mascota:   _mascotas[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}