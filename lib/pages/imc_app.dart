import 'package:flutter/material.dart';
import 'package:imcapp/model/pessoa_model.dart';
import 'package:imcapp/repositorie/imc_repository.dart';
import 'package:imcapp/repositorie/pessoa_repository.dart';
import 'package:imcapp/shared/drawer_custom.dart';

class AppImc extends StatefulWidget {
  const AppImc({super.key});

  @override
  State<AppImc> createState() => _AppImcState();
}

class _AppImcState extends State<AppImc> {
  var pessoaModel = PessoaModel();
  late PessoaRepository pessoaRepository;
  var imcTabela = ImcRepository();
  var imcDenifido = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    pessoaRepository = await PessoaRepository.carregar();
    pessoaModel = pessoaRepository.obterPessoa();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerCustom(),
        appBar: AppBar(
          title: const Text("Calcular IMC"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(239, 191, 186, 186)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Nome \n ${pessoaModel.nome}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Peso \n ${pessoaModel.peso}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Altura \n ${pessoaModel.altura}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            imcDenifido,
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                height: 25,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 71, 92, 168))),
                  onPressed: () {
                    imcDenifido = imcTabela
                        .retornoImc(pessoaModel.peso, pessoaModel.altura)
                        .toString();
                    setState(() {});
                  },
                  child: Text("Calcular IMC"),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
