import 'package:flutter/material.dart';

class MpCatalogoBasicos extends StatelessWidget {
  const MpCatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets basicos - Vet AP')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Vet AP: Clinica Veterinaria',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'consulta general - mascotas registradas: 150',
            textAlign: TextAlign.justify,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          const SizedBox(height: 8),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'ATENDIDO',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' ultima visita hace 5 dias',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const SelectableText(
            'Exp. 2024-00123',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.check_circle, size: 80, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.cancel, size: 80, color: Colors.red),
              const Icon(Icons.warning_amber, size: 80, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 32),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Agendar cita'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Registrar')),
              OutlinedButton(onPressed: () {}, child: const Text('Cancelar')),
              TextButton(onPressed: () {}, child: const Text('Ver historial')),
              ElevatedButton(onPressed: null, child: const Text('Desactivado')),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Configurar clinica'
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 0,
            ),
            child: const Text(
              'Emergencia',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.green.shade50,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Max - Labrador'),
              subtitle: const Text('consulta general - dueno: Carlos Perez'),
              isThreeLine: true,
              onTap: () {},
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.error, color: Colors.red, size: 20),
              ),
              title: const Text('Luna - Siames'),
              subtitle: const Text('en observacion - dueno: Ana Gomez'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          const Divider(height: 32),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo emergencia'),
            ),
          ),
          const Divider(height: 32),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              const Chip(label: Text('Perro')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Vacunado'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('Esterilizado'),
                selected: false,
                onSelected: (_) {},
                deleteIcon: const Icon(Icons.close, size: 16),
                padding: const EdgeInsets.all(8)
              ),
              ActionChip(
                label: const Text('Ver historial'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
              const Chip(label: Text('Gato')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Desparasitado'),
                backgroundColor: Colors.pinkAccent,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('Microchip'),
                selected: false,
                onSelected: (_) {},
                deleteIcon: const Icon(Icons.close, size: 16),
                padding: const EdgeInsets.all(8)
              ),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    value: 0.7,
                    color: Colors.green,
                    strokeWidth: 6,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(backgroundColor: Colors.grey),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: 0.6, color: Colors.indigo, minHeight: 12),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: 1.0, color: Colors.green, minHeight: 12),
          const Divider(height: 32),
        ],
      ),
    );
  }
}