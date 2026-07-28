// lib/providers/mp_metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mp_metrica_vet.dart';

class MpMetricasNotifier extends AsyncNotifier<List<MpMetricaVet>> {
  @override
  Future<List<MpMetricaVet>> build() => _fetch();

  Future<List<MpMetricaVet>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MpMetricaVet(mascota:'Max',  temperatura:38.5, peso:32.0, ppm:90,  estado:'Saludable'),
      MpMetricaVet(mascota:'Luna', temperatura:39.2, peso:4.5,  ppm:110, estado:'En observacion'),
      MpMetricaVet(mascota:'Rocky',temperatura:37.8, peso:28.0, ppm:85,  estado:'Saludable'),
      MpMetricaVet(mascota:'Piolin',temperatura:41.0,peso:0.15, ppm:120, estado:'Critico'),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final mpMetricasProvider =
    AsyncNotifierProvider<MpMetricasNotifier, List<MpMetricaVet>>(
  MpMetricasNotifier.new,
);