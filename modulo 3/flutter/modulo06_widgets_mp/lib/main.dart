import 'package:flutter/material.dart';
import 'package:modulo06_widgets/screens/mp_pantalla_contexto.dart';
import 'package:modulo06_widgets/widgets/mp_catalogo_basicos.dart';
import 'package:modulo06_widgets/widgets/mp_contador_limitado.dart';
import 'package:modulo06_widgets/widgets/mp_etiqueta.dart';
import 'package:modulo06_widgets/widgets/mp_reloj.dart';
import 'package:modulo06_widgets/widgets/mp_servicio_estado.dart';

const int paso = 7;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.green,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: MpSaludo())),
    2 => const MpCatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            MpEtiqueta(texto: 'Saludable',    color: Colors.green),
            MpEtiqueta(texto: 'Critico',     color: Colors.red,    relleno: true),
            MpEtiqueta(texto: 'En observacion', color: Colors.orange),
            MpEtiqueta(texto: 'Vacunado',   color: Colors.red,    fontSize: 16, relleno: true),
            MpEtiqueta(texto: 'Desparasitado',      color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: MpServicioEstado(nombre: 'Max - Labrador'),
      ),
    ),
    5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MpContadorLimitado(
              etiqueta: 'Cupo de mascotas',
              limite:   1,
              color:    Colors.deepPurple,
              textoBoton: 'Agregar',
              onLimite: () => debugPrint('Cupo lleno'),
            ),
            const SizedBox(height: 40),
            MpContadorLimitado(
              etiqueta: 'Pacientes en espera',
              limite:   10,
              color:    Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(
      appBar: AppBar(title: const Text('Cronometro de consulta')),
      body: const Center(child: MpReloj()),
    ),
    7 => const MpPantallaContexto(),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
  
));

class MpSaludo extends StatelessWidget {
  const MpSaludo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectableText(
      'Bienvenido a Vet AP - Clinica Veterinaria',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.green,
        shadows: [
          Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(4, 4)),
        ]
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}