// lib/widgets/catalogo_botones.dart
import 'package:flutter/material.dart';

class CatalogoBotones extends StatelessWidget {
  const CatalogoBotones({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones Material 3'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Los 5 variantes ──────────────────────────────────────
          Text(
            'Variantes — de mayor a menor énfasis',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),

          FilledButton(
            onPressed: () {},
            child: const Text('FilledButton — acción principal'),
          ),

          const SizedBox(height: 8),

          FilledButton.tonal(
            onPressed: () {},
            child: const Text('FilledButton.tonal — acción secundaria'),
          ),

          const SizedBox(height: 8),

          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton — acción con sombra'),
          ),

          const SizedBox(height: 8),

          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton — acción con borde'),
          ),

          const SizedBox(height: 8),

          TextButton(
            onPressed: () {},
            child: const Text('TextButton — acción mínima'),
          ),

          const Divider(height: 32),

          // ── Con ícono ────────────────────────────────────────────
          Text(
            'Con ícono',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send),
            label: const Text('Enviar reporte'),
          ),

          const SizedBox(height: 8),

          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Exportar logs'),
          ),

          const SizedBox(height: 8),

          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.open_in_new),
            label: const Text('Ver documentación'),
          ),

          const Divider(height: 32),

          // ── Estados y personalización ────────────────────────────
          Text(
            'Estados y personalización',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),

          // Deshabilitado automáticamente
          FilledButton(
            onPressed: null,
            child: const Text('No disponible'),
          ),

          const SizedBox(height: 8),

          // Acción destructiva usando errorContainer
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cs.errorContainer,
              foregroundColor: cs.onErrorContainer,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {},
            child: const Text('Eliminar servidor'),
          ),

          const SizedBox(height: 8),

          // Botón solo con ícono
          Center(
            child: IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Eliminar',
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 16),

          // Comparación de énfasis
          Row(
            children: [
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () {},
                  child: const Text('Reiniciar'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Apagar'),
                ),
              ),
            ],
          ),

          const Divider(height: 32),

          // ── Comparación rápida ───────────────────────────────────
          Text(
            'Comparación visual Material 3',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Tonal'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}