// lib/screens/mp_pantalla_busqueda.dart
import 'package:flutter/material.dart';
import '../models/mp_mascota.dart';
import '../widgets/mp_fila_mascota.dart';
import '../widgets/mp_tarjeta_mascota_grid.dart';

class MpPantallaBusqueda extends StatefulWidget {
  const MpPantallaBusqueda({super.key});
  @override
  State<MpPantallaBusqueda> createState() => _MpPantallaBusquedaState();
}

class _MpPantallaBusquedaState extends State<MpPantallaBusqueda> {
  final _mascotas = [
    MpMascota(id:'1', nombre:'Max',  especie:'Perro', raza:'Labrador',    edad:3, dueno:'Carlos Perez', telefono:'0991234567', favorito:true),
    MpMascota(id:'2', nombre:'Luna', especie:'Gato',  raza:'Siames',      edad:5, dueno:'Ana Gomez',    telefono:'0987654321'),
    MpMascota(id:'3', nombre:'Rocky',especie:'Perro', raza:'Bulldog',     edad:2, dueno:'Luis Torres',  telefono:'0976543210'),
    MpMascota(id:'4', nombre:'Piolin',especie:'Ave',  raza:'Canario',     edad:1, dueno:'Maria Diaz',   telefono:'0965432109'),
  ];

  String _busqueda = '';
  bool   _modoGrid = false;

  List<MpMascota> get _filtrados => _mascotas
      .where((m) =>
          m.nombre.toLowerCase().contains(_busqueda.toLowerCase()) ||
          m.especie.toLowerCase().contains(_busqueda.toLowerCase()) ||
          m.dueno.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleFavorito(MpMascota m) =>
      setState(() => m.favorito = !m.favorito);

  void _eliminar(MpMascota m) =>
      setState(() => _mascotas.removeWhere((x) => x.id == m.id));

  @override
  Widget build(BuildContext context) {
    final cs       = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${_mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:      Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip:   _modoGrid ? 'Vista lista' : 'Vista cuadricula',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por nombre, especie o dueno...',
              leading:  const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon:      const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar busqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:   2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing:  8,
                        ),
                        itemCount:   filtrados.length,
                        itemBuilder: (ctx, i) => MpTarjetaMascotaGrid(
                          mascota:   filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount:        filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => MpFilaMascota(
                          mascota:   filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}