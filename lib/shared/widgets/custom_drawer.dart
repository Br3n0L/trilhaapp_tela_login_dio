import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/pages/dados_cadastrais.dart';
import 'package:trilhaapp_tela_login_dio/pages/login_page.dart';
import 'package:trilhaapp_tela_login_dio/pages/termos_de_uso.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          InkWell(
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
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.asset(
                    'https://hermes.digitalinnovation.one/assets/diome/logo.png'),
              ),
              accountName: const Text('Breno Leal'),
              accountEmail: const Text('email@email.com'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
                        builder: (context) => const DadosCadastrais()));
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
            onTap: () {},
            child: const Text('Quem somos?'),
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
