import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp_tela_login_dio/models/dados_cadastrais.dart';
import 'package:trilhaapp_tela_login_dio/models/tarefa_hive_model.dart';

import 'package:trilhaapp_tela_login_dio/pages/main_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
