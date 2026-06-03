class ServidorClinica {
  final String hostname;
  final String ip;
  final int puerto;
  final bool usaSsl;

  ServidorClinica({
    required this.hostname,
    required this.ip,
    required this.puerto,
    this.usaSsl = false,
  });

  ServidorClinica.local()
      : hostname = 'localhost',
        ip = '127.0.0.1',
        puerto = 8080,
        usaSsl = false;

  ServidorClinica.produccion({required this.hostname, required this.ip})
      : puerto = 443,
        usaSsl = true;

  factory ServidorClinica.desdeUrl(String url) {
    final uri = Uri.parse(url);
    return ServidorClinica(
      hostname: uri.host,
      ip: uri.host,
      puerto: uri.port != 0 ? uri.port : (uri.scheme == 'https' ? 443 : 80),
      usaSsl: uri.scheme == 'https',
    );
  }

  @override
  String toString() => '${usaSsl ? "https" : "http"}://$hostname:$puerto';
}

void main() {
  final s1 = ServidorClinica(hostname: 'api.clinica-vet.com', ip: '10.0.1.5', puerto: 3000);
  final s2 = ServidorClinica.local();
  final s3 = ServidorClinica.produccion(hostname: 'api.clinica-vet.com', ip: '10.0.1.5');
  final s4 = ServidorClinica.desdeUrl('https://datos.clinica-vet.com:8443/v1');

  print(s1);
  print(s2);
  print(s3);
  print(s4);
}
