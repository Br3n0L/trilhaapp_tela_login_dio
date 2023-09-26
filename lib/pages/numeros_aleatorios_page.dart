import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumeroAleatoriosPage extends StatefulWidget {
  const NumeroAleatoriosPage({Key? key}) : super(key: key);

  @override
  _NumeroAleatoriosPageState createState() => _NumeroAleatoriosPageState();
}

class _NumeroAleatoriosPageState extends State<NumeroAleatoriosPage> {
  int? numeroGerado;
  int quantidadeDeCliques = 0; // Inicializado com 0
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';
  final CHAVE_QUANTIDADE_CLIQUES = 'quantidade_cliques';
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
      quantidadeDeCliques = storage.getInt(CHAVE_QUANTIDADE_CLIQUES) ?? 0;
    });
  }

  void salvarDados() {
    storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
    storage.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeDeCliques);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de Número Aleatório'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null
                    ? "Nenhum número gerado"
                    : numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                "Quantidade de Cliques: $quantidadeDeCliques",
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeDeCliques++;
            });
            salvarDados();
          },
        ),
      ),
    );
  }
}
