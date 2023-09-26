import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp_tela_login_dio/repositores/linguagens_repository.dart';
import 'package:trilhaapp_tela_login_dio/repositores/nivel_repository.dart';
import 'package:trilhaapp_tela_login_dio/shared/widgets/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({
    super.key,
  });

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeControler = TextEditingController(text: "");
  var dataNascimentoControler = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  List<String> linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  var nivelSelecionado = '';
  int tempoDeExperiencia = 0;
  bool salvando = false;

  late SharedPreferences storage;
  final String CHAVE_DADOS_CADASTRAIS_NOME = "CHAVE_DADOS_CADASTRAIS_NOME";
  final String CHAVE_DADOS_CADASTRAIS_DATA_NACISMENTO =
      "CHAVE_DADOS_CADASTRAIS_DATA_NACISMENTO";
  final String CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGENS =
      "CHAVE_DADOS_CADASTRAIS_LINGUAGENS";
  final String CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_SALARIO =
      "CHAVE_DADOS_CADASTRAIS_SALARIO";

  @override
  void initState() {
    niveis = nivelRepository.retornaNivel();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    nomeControler.text = storage.getString(CHAVE_DADOS_CADASTRAIS_NOME) ?? '';
    dataNascimentoControler.text =
        storage.getString(CHAVE_DADOS_CADASTRAIS_DATA_NACISMENTO) ?? '';
    nivelSelecionado =
        storage.getString(CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA) ?? '';

    storage.getStringList(CHAVE_DADOS_CADASTRAIS_LINGUAGENS) ?? [];
    tempoDeExperiencia =
        storage.getInt(CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA) ?? 0;
    salarioEscolhido = storage.getDouble(CHAVE_DADOS_CADASTRAIS_SALARIO) ?? 0;
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Dados'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView(
            children: [
              const TextLabel(
                texto: 'Nome',
              ),
              TextField(
                controller: nomeControler,
              ),
              const TextLabel(
                texto: 'Data de Nascimento',
              ),
              TextField(
                  controller: dataNascimentoControler,
                  readOnly: true,
                  onTap: () async {
                    var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900, 5, 20),
                        lastDate: DateTime(2023, 10, 23));
                    if (data != null) {
                      dataNascimentoControler.text = data.toString();
                      dataNascimento = data;
                    } else {}
                  }),
              const TextLabel(texto: "Nivel de Experiência"),
              Column(
                  children: niveis
                      .map((nivel) => RadioListTile(
                          dense: true,
                          title: Text(nivel.toString()),
                          selected: nivelSelecionado == nivel,
                          value: nivel.toString(),
                          groupValue: nivelSelecionado,
                          onChanged: (value) {
                            setState(() {
                              nivelSelecionado = value.toString();
                            });
                          }))
                      .toList()),
              const TextLabel(texto: "Linguagens Dominadas"),
              Column(
                children: linguagens
                    .map((linguagem) => CheckboxListTile(
                        dense: true,
                        title: Text(linguagem),
                        value: linguagensSelecionadas.contains(linguagem),
                        onChanged: (bool? value) {
                          if (value!) {
                            setState(() {
                              linguagensSelecionadas.add(linguagem);
                            });
                          } else {
                            setState(() {
                              linguagensSelecionadas.remove(linguagem);
                            });
                          }
                        }))
                    .toList(),
              ),
              const TextLabel(texto: "Tempo de experiência"),
              DropdownButton(
                  value: tempoDeExperiencia,
                  isExpanded: true,
                  items: returnItens(50),
                  onChanged: (value) {
                    setState(() {
                      tempoDeExperiencia = int.parse(value.toString());
                    });
                  }),
              TextLabel(
                  texto:
                      "Pretenção Salarial:R\$ ${salarioEscolhido.round().toString()}"),
              Slider(
                  min: 0,
                  max: 10000,
                  value: salarioEscolhido,
                  onChanged: ((value) {
                    setState(() {
                      salarioEscolhido = value;
                    });
                  })),
              TextButton(
                onPressed: () async {
                  if (nomeControler.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O nome deve ser preenchido")));
                    return;
                  }
                  if (dataNascimento != null) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data de Nascimento Inválida")));
                    return;
                  }
                  if (nivelSelecionado.trim() != '') {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "O nivel de experiência  deve ser selecionado")));
                    return;
                  }
                  if (linguagensSelecionadas != '') {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Selecione uma linguagem")));
                    return;
                  }
                  if (tempoDeExperiencia != 0) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Selecione um tempo de Experiencia")));
                    return;
                  }
                  if (tempoDeExperiencia != 0) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "A pretensão salarial tem que ser menor que 0")));
                    return;
                  }

                  await storage.setString(
                      CHAVE_DADOS_CADASTRAIS_NOME, nomeControler.text);
                  await storage.setString(
                      CHAVE_DADOS_CADASTRAIS_DATA_NACISMENTO,
                      dataNascimento.toString());
                  await storage.setString(
                      CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
                      nivelSelecionado);
                  await storage.setStringList(CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
                      linguagensSelecionadas);
                  await storage.setInt(CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
                      tempoDeExperiencia);

                  await storage.setDouble(
                      CHAVE_DADOS_CADASTRAIS_SALARIO, salarioEscolhido);

                  setState(() {
                    salvando = true;
                  });
                  Future.delayed(const Duration(seconds: 3), () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Dados salvo com sucesso")));
                    setState(() {
                      salvando = false;
                    });
                    Navigator.pop(context);
                  });
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
