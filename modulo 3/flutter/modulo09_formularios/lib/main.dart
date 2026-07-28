// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/mp_formulario_mascota.dart';
import 'models/mp_mascota.dart';
import 'widgets/mp_fila_mascota.dart';
import 'screens/mp_pantalla_mascotas.dart';
import 'screens/mp_pantalla_busqueda.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2D6A4F),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _MpPaso1(),
    2 => const _MpPaso2(),
    3 => const _MpPaso3(),
    4 => const MpPantallaMascotas(),
    5 => const MpPantallaBusqueda(),

    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class _MpPaso1 extends StatefulWidget {
  const _MpPaso1();
  @override
  State<_MpPaso1> createState() => _MpPaso1State();
}

class _MpPaso1State extends State<_MpPaso1> {
  final _ctrlNombre  = TextEditingController();
  final _ctrlEspecie = TextEditingController();
  final _ctrlEdad    = TextEditingController(text: '3');
  final _ctrlDueno   = TextEditingController(text: 'Carlos Perez');
  final _focusEspecie = FocusNode();
  final _focusEdad   = FocusNode();

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlEspecie.dispose();
    _ctrlEdad.dispose();
    _ctrlDueno.dispose();
    _focusEspecie.dispose();
    _focusEdad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Registro de mascota'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlNombre,
              decoration:      const InputDecoration(
                labelText:  'Nombre',
                hintText:   'Max',
                prefixIcon: Icon(Icons.pets),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusEspecie.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlEspecie,
              focusNode:       _focusEspecie,
              decoration:      const InputDecoration(
                labelText:  'Especie',
                hintText:   'Perro, Gato...',
                prefixIcon: Icon(Icons.pets),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusEdad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlEdad,
              focusNode:   _focusEdad,
              decoration:  const InputDecoration(
                labelText:  'Edad (anios)',
                prefixIcon: Icon(Icons.cake),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando a ${_ctrlNombre.text} '
                      '(${_ctrlEspecie.text} - ${_ctrlEdad.text} anios)',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.pets),
              label: const Text('Registrar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombre.clear();
                _ctrlEspecie.clear();
                _ctrlEdad.text = '3';
                _ctrlDueno.text = 'Carlos Perez';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MpPaso2 extends StatelessWidget {
  const _MpPaso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nueva mascota'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: MpFormularioMascota(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} — ${datos['especie']} (${datos['edad']} anios)'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MpPaso3 extends StatefulWidget {
  const _MpPaso3();
  @override
  State<_MpPaso3> createState() => _MpPaso3State();
}

class _MpPaso3State extends State<_MpPaso3> {
  final _mascotas = [
    MpMascota(id:'1', nombre:'Max',  especie:'Perro', raza:'Labrador',    edad:3, dueno:'Carlos Perez', telefono:'0991234567', favorito:true),
    MpMascota(id:'2', nombre:'Luna', especie:'Gato',  raza:'Siames',      edad:5, dueno:'Ana Gomez',    telefono:'0987654321'),
    MpMascota(id:'3', nombre:'Rocky',especie:'Perro', raza:'Bulldog',     edad:2, dueno:'Luis Torres',  telefono:'0976543210'),
    MpMascota(id:'4', nombre:'Piolin',especie:'Ave',  raza:'Canario',     edad:1, dueno:'Maria Diaz',   telefono:'0965432109'),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Mascotas (${_mascotas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _mascotas.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pets_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin mascotas',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _mascotas.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => MpFilaMascota(
                mascota:   _mascotas[i],
                onFavorito: () => setState(() =>
                    _mascotas[i].favorito = !_mascotas[i].favorito),
                onEliminar: () => setState(() => _mascotas.removeAt(i)),
              ),
            ),
    );
  }
}