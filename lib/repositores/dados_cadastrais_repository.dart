import 'package:hive/hive.dart';
import 'package:trilhaapp_tela_login_dio/models/dados_cadastrais.dart';

class DadosCadastraisRepository {
  static late Box _box;

  DadosCadastraisRepository._criar();

  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = Hive.box('dadosCadastraisModel');
    } else {
      _box = await Hive.openBox('configuracoes');
    }

    return DadosCadastraisRepository._criar();
  }

  salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put('dadosCadastraisModel', dadosCadastraisModel);
  }

  DadosCadastraisModel obterDados() {
    var dadosCadastraisModel = _box.get('DadosCadastraisModel');
    if (dadosCadastraisModel == null) {
      return DadosCadastraisModel.vazio();
    }
    return dadosCadastraisModel;
  }
}
