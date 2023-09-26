import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String descricao = "";
  bool concluido = false;

  Tarefa(this.descricao, this.concluido);

  String get id => _id;
}
