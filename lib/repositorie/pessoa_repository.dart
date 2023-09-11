import 'package:hive/hive.dart';
import 'package:imcapp/model/pessoa_model.dart';

class PessoaRepository {
  static late Box _box;

  PessoaRepository._criar();

  static Future<PessoaRepository> carregar() async {
    if (Hive.isBoxOpen("box_pessoa")) {
      _box = Hive.box("box_pessoa");
    } else {
      _box = await Hive.openBox("box_pessoa");
    }
    return PessoaRepository._criar();
  }

  void salvar(PessoaModel pessoaModel) {
    _box.put("box_pessoa", pessoaModel);
  }

  PessoaModel obterPessoa() {
    var pessoa = _box.get("box_pessoa");
    if (pessoa == null) {
      return PessoaModel.vazio();
    } else {
      return pessoa;
    }
  }

  alterar(PessoaModel pessoaModel) {
    pessoaModel.save();
  }

  remover(PessoaModel pessoaModel) {
    pessoaModel.delete();
  }
}
