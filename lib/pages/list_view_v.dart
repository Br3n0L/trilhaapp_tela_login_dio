import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/shared/widgets/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text('Maria Silva'),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Você vai para a reunião? '),
              Text('08:50'),
            ],
          ),
          trailing: const Icon(Icons.delete),
        ),
        // Image.asset(AppImages.user1),
        // Image.asset(AppImages.user2),
        // Image.asset(AppImages.user3),
        // Image.asset(AppImages.paisagem1),
        // Image.asset(AppImages.paisagem2),
        // Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
