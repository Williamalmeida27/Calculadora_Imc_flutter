import 'package:flutter/material.dart';

import '../model/pessoa_model.dart';
import '../repositorie/pessoa_repository.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();

  var pessoaModel = PessoaModel.vazio();
  late PessoaRepository pessoaRepository;
  String imcDefinido = "";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    pessoaRepository = await PessoaRepository.carregar();
    pessoaModel = pessoaRepository.obterPessoa();
    nomeController.text = pessoaModel.nome;
    alturaController.text = pessoaModel.altura.toString();
    pesoController.text = pessoaModel.peso.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracoes"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nomeController,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: const InputDecoration(
                hintText: "Nome", contentPadding: EdgeInsets.only(top: 0)),
          ),
          TextField(
            controller: pesoController,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: const InputDecoration(
                hintText: "Peso", contentPadding: EdgeInsets.only(top: 0)),
          ),
          TextField(
            controller: alturaController,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: const InputDecoration(
                hintText: "Altura", contentPadding: EdgeInsets.only(top: 0)),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 49, 78, 114))),
                onPressed: () {
                  if (nomeController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O nome não pode ser vazio")));
                    return;
                  } else if (pesoController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O peso não pode ser vazio")));
                    return;
                  } else if (alturaController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A altura não pode ser vazio")));
                    return;
                  }

                  pessoaModel.nome = nomeController.text;
                  pessoaModel.peso = double.parse(pesoController.text);
                  pessoaModel.altura = double.parse(alturaController.text);

                  pessoaRepository.salvar(pessoaModel);
                  setState(() {});

                  Future.delayed(const Duration(minutes: 1));

                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
