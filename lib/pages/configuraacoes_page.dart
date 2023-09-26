import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;
  TextEditingController usuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;
  // ignore: non_constant_identifier_names
  final CHAVE_NOME_USUARIO = 'CHAVE_NOME_USUARIO';
  // ignore: non_constant_identifier_names
  final CHAVE_ALTURA = 'CHAVE_ALTURA';
  // ignore: non_constant_identifier_names
  final CHAVE_RECEBER_NOTIFICACOES = 'CHAVE_RECEBER_NOTIFICACOES';
  // ignore: non_constant_identifier_names
  final CHAVE_MODO_ESCURO = 'CHAVE_MODO_ESCURO';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    usuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? '';
    alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
    receberNotificacoes = storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
    temaEscuro = storage.getBool(CHAVE_MODO_ESCURO) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Nome Usuário',
                ),
                controller: usuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Altura do Usuário',
                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
                title: const Text('Receber Notificações'),
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = !receberNotificacoes;
                  });
                }),
            SwitchListTile(
                title: const Text('Tema Escuro'),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = !temaEscuro;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setDouble(
                        CHAVE_ALTURA, double.parse(alturaController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Meu App'),
                            content: const Text(
                                'Por favor, informe uma altura válida'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ok'))
                            ],
                          );
                        });
                  }
                  await storage.setDouble(CHAVE_ALTURA,
                      double.tryParse(alturaController.text) ?? 0);
                  await storage.setBool(
                      CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                  await storage.setBool(CHAVE_MODO_ESCURO, temaEscuro);
                  Navigator.pop(context);
                },
                child: const Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
