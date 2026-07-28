// lib/screens/mp_pantalla_metricas.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mp_metrica_vet.dart';
import '../providers/mp_metricas_provider.dart';

class MpPantallaMetricas extends ConsumerWidget {
  const MpPantallaMetricas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricasAsync = ref.watch(mpMetricasProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Metricas veterinarias'),
        actions: [
          IconButton(
            icon:    const Icon(Icons.refresh),
            tooltip: 'Recargar',
            onPressed: () =>
                ref.read(mpMetricasProvider.notifier).recargar(),
          ),
        ],
      ),
      body: metricasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $e'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(mpMetricasProvider.notifier).recargar(),
                icon:  const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (metricas) => ListView.builder(
          padding:     const EdgeInsets.all(12),
          itemCount:   metricas.length,
          itemBuilder: (_, i) => _MpTarjetaMetrica(metrica: metricas[i]),
        ),
      ),
    );
  }
}

class _MpTarjetaMetrica extends StatelessWidget {
  final MpMetricaVet metrica;
  const _MpTarjetaMetrica({required this.metrica});

  @override
  Widget build(BuildContext context) {
    final cs         = Theme.of(context).colorScheme;
    final tempCritica = metrica.temperatura > 39.5;
    final ppmCritica = metrica.ppm > 115;
    final esCritico  = tempCritica || ppmCritica;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color:  esCritico ? cs.errorContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.pets, color: esCritico ? cs.error : cs.primary, size: 18),
              const SizedBox(width: 8),
              Text(metrica.mascota,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(metrica.estado,
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
            ]),
            const SizedBox(height: 10),
            _MpBarra('Temp', metrica.temperatura, 40.0, tempCritica, 'C'),
            const SizedBox(height: 4),
            _MpBarra('Peso', metrica.peso, 40.0, false, 'kg'),
            const SizedBox(height: 4),
            _MpBarra('PPM', metrica.ppm.toDouble(), 130.0, ppmCritica, 'ppm'),
          ],
        ),
      ),
    );
  }
}

class _MpBarra extends StatelessWidget {
  final String label;
  final double valor;
  final double maximo;
  final bool   critica;
  final String unidad;
  const _MpBarra(this.label, this.valor, this.maximo, this.critica, this.unidad);

  @override
  Widget build(BuildContext context) {
    final color = critica ? Colors.red : Colors.green;
    return Row(children: [
      SizedBox(width: 36, child: Text(label,
          style: const TextStyle(fontSize: 12))),
      Expanded(
        child: LinearProgressIndicator(
          value:           valor / maximo,
          backgroundColor: Colors.grey.shade200,
          valueColor:      AlwaysStoppedAnimation(color),
        ),
      ),
      const SizedBox(width: 8),
      Text('${valor.toStringAsFixed(1)} $unidad',
          style: TextStyle(fontSize: 12, color: color,
              fontWeight: FontWeight.w600)),
    ]);
  }
}