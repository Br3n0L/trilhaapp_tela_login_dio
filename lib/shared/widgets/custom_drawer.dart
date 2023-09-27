import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/pages/configuracoes/configuraacoes_hive_page%20.dart';

import 'package:trilhaapp_tela_login_dio/pages/dados_cadastrais/dados_cadastrais_hive.dart';
import 'package:trilhaapp_tela_login_dio/pages/login_page.dart';
import 'package:trilhaapp_tela_login_dio/pages/numeros_aleatorios/numeros_aleatorios_hive.dart';
import 'package:trilhaapp_tela_login_dio/pages/numeros_aleatorios/numeros_aleatorios_shared_prefereces_page.dart';
import 'package:trilhaapp_tela_login_dio/pages/termos_de_uso.dart';
import 'package:trilhaapp_tela_login_dio/shared/widgets/app_images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          InkWell(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.asset(AppImages.logoDio),
              ),
              accountName: const Text('Breno Leal'),
              accountEmail: const Text('email@email.com'),
            ),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Câmera'),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Galeria'),
                          leading: const Icon(Icons.album),
                        ),
                      ],
                    );
                  });
            },
          ),
          const SizedBox(),
          const Text(
            "Menu",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DadosCadastraisHivePage()));
              },
              child: const Text('Dados Cadastrais'),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {},
            child: const Text('Serviços'),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TermosDeUso()));
            },
            child: const Text('Termos de uso'),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NumeroAleatoriosSharedPreferencesPage()));
            },
            child: const Text('Gerador de numeros aleatórios'),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NumeroAleatoriosHivePage()));
            },
            child: const Text('Hive'),
          ),
          const Divider(),
          InkWell(
            onTap: () {},
            child: const Text('Quem somos?'),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ConfiguracoesHivePage())));
            },
            child: const Text('Configurações'),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext bc) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: const Text('Meu App'),
                  content: const Text('Deseja realmente sair do aplicativo?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Não')),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text('Sim')),
                  ],
                ),
              );
            },
            child: const Text('Sair'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
