import 'package:flutter/material.dart';

import '../model/pessoa.dart';
import '../model/tabela_imc.dart';

class AppImc extends StatefulWidget {
  const AppImc({super.key});

  @override
  State<AppImc> createState() => _AppImcState();
}

class _AppImcState extends State<AppImc> {
  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  var _pessoa = Pessoa();
  String imcDefinido = "";
  var tabelaImc = TabelaImc();

  @override
  void initState() {
    super.initState();
  }

  double calcularImc(double peso, double altura) {
    double imcCalculado = peso / (altura * 2);
    String imcCalculadoDecimal = imcCalculado.toStringAsFixed(2);
    return double.parse(imcCalculadoDecimal);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calcular IMC"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(239, 191, 186, 186)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Nome \n ${_pessoa.nome}"),
                          Text("Peso \n ${_pessoa.peso}"),
                          Text("Altura \n ${_pessoa.altura}"),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        imcDefinido,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextField(
                      controller: nomeController,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: const InputDecoration(
                          hintText: "Nome",
                          contentPadding: EdgeInsets.only(top: 0)),
                    ),
                    TextField(
                      controller: pesoController,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: const InputDecoration(
                          hintText: "Peso",
                          contentPadding: EdgeInsets.only(top: 0)),
                    ),
                    TextField(
                      controller: alturaController,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: const InputDecoration(
                          hintText: "Altura",
                          contentPadding: EdgeInsets.only(top: 0)),
                    ),
                  ],
                ),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O nome não pode ser vazio")));
                        return;
                      } else if (pesoController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O peso não pode ser vazio")));
                        return;
                      } else if (alturaController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("A altura não pode ser vazio")));
                        return;
                      }
                      double novoValor = double.parse(pesoController.text);
                      double novoValor2 = double.parse(alturaController.text);
                      var calculado = calcularImc(novoValor, novoValor2);
                      setState(() {
                        imcDefinido = tabelaImc.retornoImc(calculado);
                        _pessoa.nome = nomeController.text;
                        _pessoa.peso = novoValor;
                        _pessoa.altura = novoValor2;
                      });

                      Future.delayed(const Duration(minutes: 1));
                    },
                    icon: const Icon(
                      Icons.calculate,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
