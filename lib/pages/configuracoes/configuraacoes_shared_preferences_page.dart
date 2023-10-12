import 'package:flutter/material.dart';

import 'package:trilhaapp_tela_login_dio/services/app_storage_services.dart';

class ConfiguracoesSharedPreferecesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferecesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesSharedPreferecesPage> createState() =>
      _ConfiguracoesSharedPreferecesPageState();
}

class _ConfiguracoesSharedPreferecesPageState
    extends State<ConfiguracoesSharedPreferecesPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      carregarDados();
    });
  }

  carregarDados() async {
    nomeUsuarioController.text =
        await storage.getConfiguracoesPageNomeDoUsuario();
    alturaController.text = (await storage.getConfiguracoesAltura()).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacoes();
    temaEscuro = await storage.getConfiguracoesModoEscuro();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Configurações")),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Nome usuário"),
                    controller: nomeUsuarioController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Altura"),
                    controller: alturaController,
                  ),
                ),
                SwitchListTile(
                  title: const Text("Receber notificações"),
                  onChanged: (bool value) {
                    setState(() {
                      receberNotificacoes = value;
                    });
                  },
                  value: receberNotificacoes,
                ),
                SwitchListTile(
                    title: const Text("Tema escuro"),
                    value: temaEscuro,
                    onChanged: (bool value) {
                      setState(() {
                        temaEscuro = value;
                      });
                    }),
                TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      try {
                        await storage.setConfiguracoesAltura(
                            double.parse(alturaController.text));
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Meu App"),
                                content: const Text(
                                    "Favor informar uma altura válida!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"))
                                ],
                              );
                            });
                        return;
                      }
                      await storage.setConfiguracoesPageNomeDoUsuario(
                          nomeUsuarioController.text);
                      await storage.setConfiguracoesReceberNotificacoes(
                          receberNotificacoes);
                      await storage.setConfiguracoesModoEscuro(temaEscuro);
                      Navigator.pop(context);
                    },
                    child: const Text("Salvar"))
              ],
            )));
  }
}
