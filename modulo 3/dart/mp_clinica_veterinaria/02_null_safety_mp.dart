void main() {
  // Tipo no-nullable
  String mascota = 'Luna';

  // Tipo nullable — propietario
  String? propietario = null;   // OK
  propietario = 'María';       // OK

  String? clinica = 'Clinica Vet';
  print(clinica?.length);

  String resultado = clinica ?? 'Sin clínica';
  print(resultado);

  String clinicaSegura = clinica!;  // lanza si clinica es null

  if (propietario != null) {
    print(propietario.length);
  }

  late String tokenAcceso;
  tokenAcceso = 'token_vet_123';
  print(tokenAcceso);
}
