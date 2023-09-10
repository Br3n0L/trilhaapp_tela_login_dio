import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
