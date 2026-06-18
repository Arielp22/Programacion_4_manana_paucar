import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer? _timer; // nullable
  int _segundos = 0;

  int vueltas = 0;
  final List<int> _tiemposVuelta = [];

  bool _pausado = false;

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(milliseconds: 100), // 10× más rápido
      (_) {
        if (!mounted) return;

        setState(() {
          _segundos++;
        });
      },
    );
  }

  void _guardarVuelta() {
    setState(() {
      vueltas++;
      _tiemposVuelta.add(_segundos);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;

      if (_pausado) {
        _timer?.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    // Si comentas esta línea en debug,
    // puede aparecer warning por callbacks activos.
    super.dispose();
  }

  String _formatearTiempo(int total) {
    final h = total ~/ 3600;
    final m = (total % 3600) ~/ 60;
    final s = total % 60;

    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get _formato => _formatearTiempo(_segundos);

  Color get _colorTiempo {
    Color colorTiempo;

    if (_segundos > 120) {
      colorTiempo = Colors.red;
    } else if (_segundos > 60) {
      colorTiempo = Colors.orange;
    } else {
      colorTiempo = Colors.green;
    }

    // segundo color condicional
    return _segundos > 120
        ? Colors.deepPurple
        : colorTiempo;
  }

  @override
  Widget build(BuildContext context) {
    final ultimaVuelta =
        _tiemposVuelta.isEmpty ? null : _tiemposVuelta.last;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formato,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: _colorTiempo,
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(
                _pausado
                    ? Icons.play_arrow
                    : Icons.pause,
              ),
              label: Text(
                _pausado
                    ? 'Reanudar'
                    : 'Pausar',
              ),
            ),

            const SizedBox(width: 8),

            FilledButton(
              onPressed: _guardarVuelta,
              child: const Text('Vuelta'),
            ),

            const SizedBox(width: 8),

            TextButton(
              onPressed: () {
                setState(() {
                  _timer?.cancel();

                  _segundos = 0;
                  vueltas = 0;
                  _tiemposVuelta.clear();

                  _pausado = false;

                  _iniciarTimer();
                });
              },
              child: const Text('Reiniciar'),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          _pausado ? 'Pausado' : 'Corriendo',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),

        if (ultimaVuelta != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Última vuelta #$vueltas: ${_formatearTiempo(ultimaVuelta)}',
            ),
          ),
      ],
    );
  }
}