void main() {
  String codigo = '404';

  switch (codigo) {
    case '200':
      print('Consulta OK');
      break;
    case '201':
      print('Creado');
      break;
    case '400':
      print('Solicitud inválida');
      break;
    case '401':
      print('No autorizado');
      break;
    case '404':
      print('Paciente no encontrado');
      break;
    case '500':
      print('Error del servidor');
      break;
    default:
      print('Código desconocido');
  }
}
