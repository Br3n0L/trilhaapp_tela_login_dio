import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/pages/card_page.dart';
import 'package:trilhaapp_tela_login_dio/pages/image_assets.dart';
import 'package:trilhaapp_tela_login_dio/pages/list_view_h.dart';
import 'package:trilhaapp_tela_login_dio/pages/list_view_v.dart';
import 'package:trilhaapp_tela_login_dio/pages/tarefas_page/tarefa_hive_page.dart';
import 'package:trilhaapp_tela_login_dio/pages/tarefas_page/tarefa_sqlite_page.dart';
import 'package:trilhaapp_tela_login_dio/pages/tarefas_page/constulta_cep.dart';
import 'package:trilhaapp_tela_login_dio/shared/widgets/custom_drawer.dart';

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
          drawer: const CustomDrawer(),
          appBar: AppBar(
            title: const Text(''),
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
                    ConsultaCep(),
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewHPage(),
                    ListViewHorizontal(),
                    TarefaSQLitePage(),
                  ],
                ),
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                    label: "HTPP",
                    icon: Icon(Icons.get_app_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Total",
                    icon: Icon(Icons.person),
                  ),
                  BottomNavigationBarItem(
                    label: "Mensagens",
                    icon: Icon(Icons.message),
                  ),
                  BottomNavigationBarItem(
                    label: "Produtos",
                    icon: Icon(Icons.post_add_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: "Tarefas",
                    icon: Icon(Icons.list),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
