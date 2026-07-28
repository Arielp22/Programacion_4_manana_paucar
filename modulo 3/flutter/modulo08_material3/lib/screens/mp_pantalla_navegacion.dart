// lib/screens/mp_pantalla_navegacion.dart
import 'package:flutter/material.dart';

class MpPantallaNavegacion extends StatefulWidget {
  const MpPantallaNavegacion({super.key});

  @override
  State<MpPantallaNavegacion> createState() => _MpPantallaNavegacionState();
}

class _MpPantallaNavegacionState extends State<MpPantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Vet AP - Clinica Veterinaria'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _MpPantallaDashboard(),
          _MpPantallaMascotas(),
          _MpPantallaAlertas(),
          _MpPantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.tertiaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Resumen',
          ),
          NavigationDestination(
            icon:         Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.pets),
            label:        'Mascotas',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.notifications)),
            label:        'Alertas',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Ajustes',
          ),
        ],
      ),
    );
  }
}

class _MpPantallaDashboard extends StatelessWidget {
  const _MpPantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen del dia', style: text.headlineSmall),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _MpTarjetaMetrica(titulo: 'Mascotas', valor: '12',  icono: Icons.pets,          color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _MpTarjetaMetrica(titulo: 'Alertas',    valor: '3',  icono: Icons.notifications, color: cs.errorContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _MpTarjetaMetrica(titulo: 'Consultas',   valor: '8', icono: Icons.medical_services, color: cs.tertiaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _MpTarjetaMetrica(titulo: 'Vacunados',  valor: '5', icono: Icons.vaccines,       color: cs.secondaryContainer)),
        ]),
      ],
    );
  }
}

class _MpTarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _MpTarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _MpPantallaMascotas extends StatelessWidget {
  const _MpPantallaMascotas();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (ctx, i) {
        final nombres = ['Max', 'Luna', 'Rocky', 'Piolin', 'Copito', 'Bruno'];
        final especies = ['Labrador', 'Siames', 'Bulldog', 'Canario', 'Conejo', 'Pastor'];
        return Card(
          child: ListTile(
            leading:  Icon(Icons.pets, color: cs.primary),
            title:    Text(nombres[i]),
            subtitle: Text('${especies[i]} - dueno: dueño ${i + 1}'),
            trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class _MpPantallaAlertas extends StatelessWidget {
  const _MpPantallaAlertas();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const alertas = [
      (mascota: 'Max',  mensaje: 'Fiebre > 39C',        nivel: 'CRITICO'),
      (mascota: 'Luna', mensaje: 'Vacuna pendiente',      nivel: 'AVISO'),
      (mascota: 'Rocky', mensaje: 'Cirugia programada', nivel: 'CRITICO'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: alertas.length,
      itemBuilder: (ctx, i) {
        final alerta = alertas[i];
        final esCritico = alerta.nivel == 'CRITICO';

        return Card(
          color: esCritico ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esCritico ? Icons.error : Icons.warning,
              color: esCritico ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(alerta.mascota,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(alerta.mensaje),
            trailing: Chip(
              label: Text(alerta.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esCritico ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esCritico ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MpPantallaAjustes extends StatelessWidget {
  const _MpPantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title:   Text('Seguridad'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Acerca de'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}