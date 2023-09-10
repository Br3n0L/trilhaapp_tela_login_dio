import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/pages/dados_cadastrais.dart';
import 'package:trilhaapp_tela_login_dio/pages/page1.dart';
import 'package:trilhaapp_tela_login_dio/pages/page2.dart';
import 'package:trilhaapp_tela_login_dio/pages/page3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastrais()));
                  },
                  child: const Text('Dados Cadastrais'),
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
                  child: const Text('Serviços'),
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
                  child: const Text('Termos de uso'),
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
                  child: const Text('Quem somos?'),
                ),
                const Divider(),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('Bem-Vindo'),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  children: const [
                    Page01(),
                    Page02(),
                    Page03(),
                  ],
                ),
              ),
              BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Dados",
                    icon: Icon(Icons.person),
                  ),
                  BottomNavigationBarItem(
                    label: "Cursos",
                    icon: Icon(Icons.menu),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
