// lib/screens/mp_pantalla_login.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mp_auth_provider.dart';

class MpPantallaLogin extends ConsumerStatefulWidget {
  const MpPantallaLogin({super.key});

  @override
  ConsumerState<MpPantallaLogin> createState() => _MpPantallaLoginState();
}

class _MpPantallaLoginState extends ConsumerState<MpPantallaLogin> {
  final _formKey  = GlobalKey<FormState>();
  final _ctrlUser = TextEditingController();
  final _ctrlPass = TextEditingController();

  @override
  void dispose() {
    _ctrlUser.dispose();
    _ctrlPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(mpAuthProvider);
    final cs        = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.pets, size: 64, color: cs.primary),
                const SizedBox(height: 16),
                const Text('Vet AP',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 32),

                TextFormField(
                  controller: _ctrlUser,
                  decoration: const InputDecoration(
                    labelText:  'Usuario',
                    prefixIcon: Icon(Icons.person_outline),
                    border:     OutlineInputBorder(),
                  ),
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller:  _ctrlPass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText:  'Contrasena',
                    prefixIcon: Icon(Icons.lock_outline),
                    border:     OutlineInputBorder(),
                  ),
                  validator: (v) => v == null || v.isEmpty ? 'Requerida' : null,
                ),
                const SizedBox(height: 8),

                if (authState is MpErrorAuth)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(authState.mensaje,
                        style: TextStyle(color: cs.error)),
                  ),
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: authState is MpCargando
                        ? null
                        : () {
                            if (!_formKey.currentState!.validate()) return;
                            ref.read(mpAuthProvider.notifier).login(
                                _ctrlUser.text, _ctrlPass.text);
                          },
                    child: authState is MpCargando
                        ? const SizedBox(
                            width: 20, height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Iniciar sesion'),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Pista: vet / vet123',
                    style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}