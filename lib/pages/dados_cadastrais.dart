import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  const DadosCadastrais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus Dados'),
      ),
      body: const Center(
        child: Text('Nome, Cpf, E-mail'),
      ),
    );
  }
}
