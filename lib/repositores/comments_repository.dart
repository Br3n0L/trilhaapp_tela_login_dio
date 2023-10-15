import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaapp_tela_login_dio/models/commments_model.dart';
import 'package:trilhaapp_tela_login_dio/models/post_model.dart';

class CommentsRepository {
  Future<List<CommentsModel>> retornaComentarios(int postId) async {
    try {
      var response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/$postId/2/comments'));
      if (response.statusCode == 200) {
        print('Requisição bem-sucedida');
        var jsonCommets = jsonDecode(response.body) as List<dynamic>;

        List<CommentsModel> comments = jsonCommets
            .map((e) => CommentsModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return comments;
      } else {
        throw Exception('Falha na solicitação HTTP');
      }
    } catch (e) {
      print('Erro: $e');
      return [];
    }
  }
}
