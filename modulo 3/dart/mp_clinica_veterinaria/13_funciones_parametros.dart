void configurarServidor({
  required String host,
  required int puerto,
  bool ssl = true,
  int timeoutSeg = 30,
}) {
  final protocolo = ssl ? 'https' : 'http';
  print('Conectando a $protocolo://$host:$puerto (timeout: ${timeoutSeg}s)');
}

void main() {
  configurarServidor(
    host: 'db.clinica-vet.com',
    puerto: 5432,
    ssl: false,
    timeoutSeg: 60,
  );

  configurarServidor(
    host: 'api.clinica-vet.com',
    puerto: 443,
  );
}
