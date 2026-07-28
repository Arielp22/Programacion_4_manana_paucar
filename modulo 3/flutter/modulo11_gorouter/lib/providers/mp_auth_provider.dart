// lib/providers/mp_auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class MpAuthState { const MpAuthState(); }
class MpSinSesion   extends MpAuthState { const MpSinSesion(); }
class MpCargando    extends MpAuthState { const MpCargando(); }
class MpAutenticado extends MpAuthState {
  final String usuario;
  const MpAutenticado(this.usuario);
}
class MpErrorAuth   extends MpAuthState {
  final String mensaje;
  const MpErrorAuth(this.mensaje);
}

class MpAuthNotifier extends Notifier<MpAuthState> {
  @override
  MpAuthState build() => const MpSinSesion();

  Future<void> login(String usuario, String password) async {
    state = const MpCargando();
    await Future.delayed(const Duration(seconds: 1));

    if (usuario == 'vet' && password == 'vet123') {
      state = MpAutenticado(usuario);
    } else {
      state = const MpErrorAuth('Usuario o contrasena incorrectos');
      await Future.delayed(const Duration(seconds: 2));
      state = const MpSinSesion();
    }
  }

  void logout() => state = const MpSinSesion();
}

final mpAuthProvider =
    NotifierProvider<MpAuthNotifier, MpAuthState>(MpAuthNotifier.new);