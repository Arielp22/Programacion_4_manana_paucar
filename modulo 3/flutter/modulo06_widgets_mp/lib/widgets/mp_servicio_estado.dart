import 'package:flutter/material.dart';

class MpServicioEstado extends StatefulWidget {
  final String nombre;

  const MpServicioEstado({
    super.key,
    required this.nombre,
  });

  @override
  State<MpServicioEstado> createState() => _MpServicioEstadoState();
}

class _MpServicioEstadoState extends State<MpServicioEstado> {
  bool _activo = true;
  int _reinicios = 0;
  static const int _maxReinicios = 1;
  String _nivel = 'normal';

  void _actualizarNivel() {
    if (_reinicios >= 2) {
      _nivel = 'critico';
    } else if (_reinicios >= 1) {
      _nivel = 'warning';
    } else {
      _nivel = 'normal';
    }
  }

  Color _colorNivel() {
    switch (_nivel) {
      case 'warning':
        return Colors.orange;
      case 'critico':
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (_activo) {
        _reinicios++;
      }
      _actualizarNivel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reinicios >= _maxReinicios;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _activo ? Icons.check_circle : Icons.error,
            size: 72,
            color: _colorNivel(),
          ),
          const SizedBox(height: 8),
          Text(
            _activo ? 'Atencion: ${widget.nombre}' : 'Fuera de servicio',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontStyle:
                  _activo ? FontStyle.normal : FontStyle.italic,
              color:
                  _activo ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Nivel: $_nivel',
            style: TextStyle(
              color: _colorNivel(),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (!_activo)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.red.shade300,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber,
                    color: Colors.red,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Requiere atencion',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(
              _activo
                  ? Icons.stop
                  : Icons.play_arrow,
            ),
            label: Text(
              _activo
                  ? 'Cerrar consulta'
                  : 'Iniciar consulta',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _activo
                      ? Colors.red.shade600
                      : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              setState(() {
                _activo = true;
                _reinicios = 0;
                _nivel = 'normal';
              });
            },
            child: const Text('Reiniciar'),
          ),
          Opacity(
            opacity: enLimite ? 0.1 : 1.0,
            child: Text(
              'Consultas: $_reinicios / $_maxReinicios',
              style: TextStyle(
                fontSize: 13,
                color:
                    enLimite
                        ? Colors.red
                        : Colors.grey.shade600,
              ),
            ),
          ),
          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Limite de consultas alcanzado',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}