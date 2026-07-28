// lib/providers/mp_mascotas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mp_mascota.dart';

class MpMascotasNotifier extends Notifier<List<MpMascota>> {
  @override
  List<MpMascota> build() => [
    MpMascota(id:'1', nombre:'Max',  especie:'Perro', dueno:'Carlos Perez', edad:3, vacunado:true,  favorito:true),
    MpMascota(id:'2', nombre:'Luna', especie:'Gato',  dueno:'Ana Gomez',    edad:5, vacunado:true),
    MpMascota(id:'3', nombre:'Rocky',especie:'Perro', dueno:'Luis Torres',  edad:2, vacunado:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((m) =>
        m.id == id
          ? MpMascota(id:m.id, nombre:m.nombre, especie:m.especie,
                      dueno:m.dueno, edad:m.edad, vacunado:m.vacunado,
                      favorito:!m.favorito)
          : m
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((m) => m.id != id).toList();
  }

  void agregar(MpMascota mascota) {
    state = [...state, mascota];
  }
}

final mpMascotasProvider =
    NotifierProvider<MpMascotasNotifier, List<MpMascota>>(
  MpMascotasNotifier.new,
);

final mpBusquedaProvider = StateProvider<String>((ref) => '');

final mpMascotasFiltradosProvider = Provider<List<MpMascota>>((ref) {
  final busqueda = ref.watch(mpBusquedaProvider).toLowerCase();
  final mascotas = ref.watch(mpMascotasProvider);
  if (busqueda.isEmpty) return mascotas;
  return mascotas.where((m) =>
    m.nombre.toLowerCase().contains(busqueda) ||
    m.especie.toLowerCase().contains(busqueda) ||
    m.dueno.toLowerCase().contains(busqueda)
  ).toList();
});
