import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/shared/widgets/app_images.dart';

class ImageAssetsPage extends StatelessWidget {
  const ImageAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ListTile(),
          Image.asset(
            AppImages.user1,
            height: 50,
          ),
          Image.asset(
            AppImages.user2,
            height: 50,
          ),
          Image.asset(
            AppImages.user3,
            height: 50,
          ),
          Image.asset(
            AppImages.paisagem1,
            width: double.infinity,
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            AppImages.paisagem2,
            height: 50,
          ),
          Image.asset(
            AppImages.paisagem3,
            height: 50,
          ),
        ],
      ),
    );
  }
}
