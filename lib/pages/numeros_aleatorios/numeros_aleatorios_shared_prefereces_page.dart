import 'dart:math';

import 'package:flutter/material.dart';

import 'package:trilhaapp_tela_login_dio/services/app_storage_services.dart';

class NumeroAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumeroAleatoriosSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  _NumeroAleatoriosSharedPreferencesPageState createState() =>
      _NumeroAleatoriosSharedPreferencesPageState();
}

class _NumeroAleatoriosSharedPreferencesPageState
    extends State<NumeroAleatoriosSharedPreferencesPage> {
  int? numeroGerado;
  int quantidadeDeCliques = 0;
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';
  final CHAVE_QUANTIDADE_CLIQUES = 'quantidade_cliques';
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    quantidadeDeCliques = await storage.getQuantidadeCliques();
    setState(() {});
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
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeDeCliques++;
            });
            await storage.setNumeroAleatorio(numeroGerado!);
            await storage.setQuantidadeCliques(quantidadeDeCliques);
          },
        ),
      ),
    );
  }
}
