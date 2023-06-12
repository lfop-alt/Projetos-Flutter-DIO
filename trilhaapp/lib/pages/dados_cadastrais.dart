import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';

import '../service/shared/widget/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado;
  var linguagemRepository = LinguagenRepository();
  var linguagens = [];
  var linguegemSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 1;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.getNiveis();
    linguagens = linguagemRepository.retornarLinguagem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dados Cadastrais"),
        ),
        body: salvando
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                child: ListView(
                  children: [
                    const TextLabel(texto: "Nome"),
                    TextField(
                      controller: nomeController,
                    ),
                    const TextLabel(texto: "Data de Nascimento"),
                    TextField(
                      controller: dataNascimentoController,
                      readOnly: true, // não fazer a escrita
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2023, 1, 1),
                          firstDate: DateTime(2000, 1, 1),
                          lastDate: DateTime(2030, 1, 1),
                        );
                        if (data != null) {
                          dataNascimentoController.text = data.toString();
                          dataNascimento = data;
                        }
                      },
                    ),
                    const TextLabel(
                      texto: "Niveis de Experiencia",
                    ),
                    Column(
                        children: niveis
                            .map(
                              (e) => RadioListTile(
                                dense: true,
                                selected: nivelSelecionado == niveis,
                                title: Text(e),
                                value: e,
                                groupValue: nivelSelecionado,
                                onChanged: (value) {
                                  setState(() {
                                    nivelSelecionado = value;
                                  });
                                },
                              ),
                            )
                            .toList()),
                    const TextLabel(texto: "Linguens Preferidas"),
                    Column(
                      children: linguagens
                          .map((lingua) => CheckboxListTile(
                                dense: true,
                                title: Text(lingua),
                                value: linguegemSelecionadas.contains(lingua),
                                onChanged: (value) {
                                  if (value!) {
                                    setState(() {
                                      linguegemSelecionadas.add(lingua);
                                    });
                                  } else {
                                    setState(() {
                                      linguegemSelecionadas.remove(lingua);
                                    });
                                  }
                                },
                              ))
                          .toList(),
                    ),
                    TextLabel(
                        texto:
                            "Pretenção Salarial: R\$ ${salarioEscolhido.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: salarioEscolhido,
                        onChanged: ((value) {
                          setState(() {
                            salarioEscolhido = value;
                          });
                        })),
                    const TextLabel(texto: "Tempo de experiencia"),
                    DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("1"),
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Nome com  tamanho invalido"),
                            ),
                          );
                          return;
                        }

                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Tempo de Experiencia precisar ser maior que 0"),
                            ),
                          );
                          return;
                        }

                        if (salarioEscolhido < 1500 &&
                            salarioEscolhido > 10000) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Salario escolhido fora dos limites"),
                            ),
                          );
                          return;
                        }

                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(
                          const Duration(seconds: 5),
                          () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Dados Salvo com sucesso")));
                            // setState(() {
                            //   salvando = false;
                            // });
                            Navigator.pop(context);
                          },
                        );
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                ),
              ));
  }
}
