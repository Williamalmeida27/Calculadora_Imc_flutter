import 'package:hive/hive.dart';

part 'pessoa_model.g.dart';

@HiveType(typeId: 0)
class PessoaModel extends HiveObject {
  @HiveField(0)
  String _nome = "";

  @HiveField(1)
  double _peso = 0;

  @HiveField(2)
  double _altura = 0;

  PessoaModel();

  PessoaModel.vazio() {
    _nome = '';
    _peso = 0;
    _altura = 0;
  }

  String get nome => _nome;

  double get peso => _peso;

  double get altura => _altura;

  void set nome(String nome) {
    _nome = nome;
  }

  void set peso(double peso) {
    _peso = peso;
  }

  void set altura(double altura) {
    _altura = altura;
  }
}
