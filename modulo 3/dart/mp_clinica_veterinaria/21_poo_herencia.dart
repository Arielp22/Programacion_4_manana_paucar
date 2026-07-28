class Animal {
  final String nombre;
  final int edadAnios;

  Animal(this.nombre, this.edadAnios);

  String hacerSonido() => '...';

  void presentarse() {
    print('Soy $nombre, tengo $edadAnios años y hago: ${hacerSonido()}');
  }
}

class Perro extends Animal {
  Perro(super.nombre, super.edadAnios);

  @override
  String hacerSonido() => '¡Guau!';

  void buscarPelota() => print('$nombre busca la pelota');
}

class Gato extends Animal {
  Gato(super.nombre, super.edadAnios);

  @override
  String hacerSonido() => '¡Miau!';

  void trepar() => print('$nombre trepa al rascador de gatos');
}

void main() {
  final perro = Perro('Rex', 3);
  final gato = Gato('Misu', 5);

  perro.presentarse();
  gato.presentarse();

  perro.buscarPelota();
  gato.trepar();
}
