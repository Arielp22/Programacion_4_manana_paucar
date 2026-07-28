// lib/widgets/mp_formulario_mascota.dart
import 'package:flutter/material.dart';

class MpFormularioMascota extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const MpFormularioMascota({super.key, required this.onGuardar});

  @override
  State<MpFormularioMascota> createState() => _MpFormularioMascotaState();
}

class _MpFormularioMascotaState extends State<MpFormularioMascota> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlNombre  = TextEditingController();
  final _ctrlEspecie = TextEditingController();
  final _ctrlRaza    = TextEditingController();
  final _ctrlEdad    = TextEditingController(text: '1');
  final _ctrlDueno   = TextEditingController();

  final _focusEspecie  = FocusNode();
  final _focusRaza     = FocusNode();
  final _focusEdad     = FocusNode();
  final _focusDueno    = FocusNode();

  String _tamano = 'Mediano';
  String _estadoSalud = 'Saludable';
  bool   _vacunado = true;

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlEspecie.dispose();
    _ctrlRaza.dispose();
    _ctrlEdad.dispose();
    _ctrlDueno.dispose();
    _focusEspecie.dispose();
    _focusRaza.dispose();
    _focusEdad.dispose();
    _focusDueno.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':  _ctrlNombre.text,
      'especie': _ctrlEspecie.text,
      'raza':    _ctrlRaza.text,
      'edad':    _ctrlEdad.text,
      'dueno':   _ctrlDueno.text,
      'tamano':  _tamano,
      'vacunado': _vacunado.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller:      _ctrlNombre,
            decoration:      const InputDecoration(
              labelText:  'Nombre de la mascota',
              hintText:   'Max',
              prefixIcon: Icon(Icons.pets),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusEspecie.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 2)                  return 'Minimo 2 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlEspecie,
            focusNode:       _focusEspecie,
            decoration:      const InputDecoration(
              labelText:  'Especie',
              hintText:   'Perro, Gato, Ave...',
              prefixIcon: Icon(Icons.pets),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusRaza.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La especie es obligatoria';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlRaza,
            focusNode:       _focusRaza,
            decoration:      const InputDecoration(
              labelText:  'Raza',
              hintText:   'Labrador, Siames...',
              prefixIcon: Icon(Icons.auto_awesome),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusEdad.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La raza es obligatoria';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlEdad,
            focusNode:       _focusEdad,
            decoration:      const InputDecoration(
              labelText:  'Edad (anios)',
              prefixIcon: Icon(Icons.cake),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusDueno.requestFocus(),
            validator: (v) {
              final edad = int.tryParse(v ?? '');
              if (edad == null)           return 'Debe ser un numero';
              if (edad < 0 || edad > 30)  return 'Edad entre 0 y 30 anios';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlDueno,
            focusNode:       _focusDueno,
            decoration:      const InputDecoration(
              labelText:  'Nombre del dueno',
              prefixIcon: Icon(Icons.person_outline),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El dueno es obligatorio' : null,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value:      _tamano,
            decoration: const InputDecoration(
              labelText:  'Tamano',
              prefixIcon: Icon(Icons.straighten),
              border:     OutlineInputBorder(),
            ),
            items: ['Pequeño', 'Mediano', 'Grande']
                .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _tamano = v!),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value:      _estadoSalud,
            decoration: const InputDecoration(
              labelText:  'Estado de salud',
              prefixIcon: Icon(Icons.health_and_safety),
              border:     OutlineInputBorder(),
            ),
            items: ['Saludable', 'En observacion', 'Critico']
                .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _estadoSalud = v!),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title:     const Text('Vacunado'),
            subtitle:  const Text('Esquema de vacunacion completo'),
            value:     _vacunado,
            onChanged: (v) => setState(() => _vacunado = v),
            secondary: const Icon(Icons.vaccines),
          ),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar mascota'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}