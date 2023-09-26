import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumeroAleatoriosHivePage extends StatefulWidget {
  const NumeroAleatoriosHivePage({Key? key}) : super(key: key);

  @override
  _NumeroAleatoriosHivePageState createState() =>
      _NumeroAleatoriosHivePageState();
}

class _NumeroAleatoriosHivePageState extends State<NumeroAleatoriosHivePage> {
  int? numeroGerado;
  int quantidadeDeCliques = 0;
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';
  final CHAVE_QUANTIDADE_CLIQUES = 'quantidade_cliques';
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('box_numeros_aleatorios')) {
      boxNumerosAleatorios = Hive.box('box_numeros_aleatorios');
    } else {
      boxNumerosAleatorios = await Hive.openBox('box_numeros_aleatorios');
    }

    numeroGerado = boxNumerosAleatorios.get('numeroGerado') ?? 0;
    quantidadeDeCliques = boxNumerosAleatorios.get('quantidadeDeCliques') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de Número(HIVE)'),
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
            boxNumerosAleatorios.put('numeroGerado', numeroGerado);
            boxNumerosAleatorios.put(
                'quantidadeDeCliques', quantidadeDeCliques);
          },
        ),
      ),
    );
  }
}
