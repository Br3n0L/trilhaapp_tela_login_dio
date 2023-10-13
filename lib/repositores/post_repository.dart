import 'dart:convert';

import 'package:trilhaapp_tela_login_dio/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        print('Requisição bem-sucedida');

        var jsonPosts = jsonDecode(response.body) as List<dynamic>;

        List<PostModel> posts = jsonPosts
            .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return posts;
      } else {
        throw Exception('Falha na solicitação HTTP');
      }
    } catch (e) {
      // Trate a exceção aqui e retorne algo apropriado, como uma lista vazia
      print('Erro: $e');
      return [];
    }
  }
}
