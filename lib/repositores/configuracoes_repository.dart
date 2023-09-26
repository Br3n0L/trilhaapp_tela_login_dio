// import 'package:hive/hive.dart';
// import 'package:trilhaapp_tela_login_dio/models/configuracoes_model.dart';

// class ConfiguracoesRepository {
//   static late Box box;

//   ConfiguracoesRepository._criar();

//   static Future<ConfiguracoesRepository> carregar() async {
//     if (Hive.isBoxOpen('configuracoes')) {
//       box = Hive.box('configuracoes');
//     } else {
//       box = await Hive.openBox('configuracoes');
//     }

//     return ConfiguracoesRepository._criar();
//   }

//   void salvar(ConfiguracoesModel configuracoesModel) {
//     box.put('configuracoesModel', {
//       'nomeUsuario': configuracoesModel.nomeUsuario,
//       'altura': configuracoesModel.altura,
//       'receberNotificacoes': configuracoesModel.receberNotificacoes,
//       'temaEscuro': configuracoesModel.temaEscuro,
//     });
//   }

//   ConfiguracoesModel obterDados() {
//     var configuracoes = box.get('configuracoesModel');
//     if (configuracoes == null) {
//       return ConfiguracoesModel.vazio();
//     }
//     return ConfiguracoesModel();
//   }
// }
