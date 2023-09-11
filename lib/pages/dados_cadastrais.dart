import 'package:flutter/material.dart';
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
  var linguagensSelecionadas = [];
  double pretensaoSalarial = 0;
  var nivelSelecionado = "";
  int tempoDeExperiencia = 0;
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNivel();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
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
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2023, 12, 31));
                  if (data != null) {
                    dataNascimentoControler.text = data.toString();
                    dataNascimento = data;
                  }
                },
              ),
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
                      "Pretenção Salarial:R\$ ${pretensaoSalarial.round().toString()}"),
              Slider(
                  min: 0,
                  max: 10000,
                  value: pretensaoSalarial,
                  onChanged: ((value) {
                    setState(() {
                      pretensaoSalarial = value;
                    });
                  })),
              TextButton(
                onPressed: () {
                  setState(() {
                    salvando = false;
                  });
                  if (nomeControler.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O nome deve ser preenchido")));
                    return;
                  }
                  if (dataNascimento == null) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data de Nascimento Inválida")));
                    return;
                  }
                  if (nivelSelecionado.trim() == '') {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O nivel  deve ser selecionado")));
                    return;
                  }
                  if (linguagensSelecionadas.isEmpty) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Selecione uma linguagem")));
                    return;
                  }
                  if (tempoDeExperiencia == 0) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Selecione um tempo de Experiencia")));
                    return;
                  }
                  if (tempoDeExperiencia == 0) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "A pretensão salarial tem que ser menor que 0")));
                    return;
                  }
                  print('Salvo com sucesso');
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
