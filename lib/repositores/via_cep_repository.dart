import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trilhaapp_tela_login_dio/models/via_cep_model.dart';

class ViaCepRepository {
  Future<ViaCepModel> consultarCep(String cep) async {
    try {
      String url = 'https://viacep.com.br/ws/$cep/json/';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Requisição bem-sucedida');

        var json = jsonDecode(response.body);
        return ViaCepModel.fromJson(json);
      }
    } catch (e) {}

    return ViaCepModel();
  }
}
