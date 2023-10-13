import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp_tela_login_dio/models/via_cep_model.dart';
import 'package:trilhaapp_tela_login_dio/repositores/via_cep_repository.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  TextEditingController _controllerCep = TextEditingController();

  bool loading = false;
  var viaCepModel = ViaCepModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              const Text(
                'Consulta de CEP',
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerCep,
                  onChanged: (String value) async {
                    var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                    String url = 'https://viacep.com.br/ws/$cep/json/';

                    if (cep.length == 8) {
                      setState(() {
                        loading = true;
                      });
                      ViaCepRepository repository = ViaCepRepository();
                      viaCepModel = await repository.consultarCep(cep);
                    } else {
                      // Lidar com outros casos, se necessário
                    }

                    setState(() {
                      loading = false;
                    });
                  }),
              const SizedBox(
                height: 50,
              ),
              Text(
                viaCepModel.logradouro ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              Text("${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}"),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
