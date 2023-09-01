class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;

  Pessoa();

  //getters
  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;

  //Setters
  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }
}
