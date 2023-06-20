import 'package:calculadora_imc/src/calcular_imc.dart';
import 'package:calculadora_imc/src/model/imc_model.dart';
import 'package:calculadora_imc/src/repositories/imc_repository.dart';
import 'package:flutter/material.dart';

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key});

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  ImcRepository imcRepository = ImcRepository();
  var pesoController = TextEditingController(text: "");
  var nomeController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController();
  var _imcs = const <ImcModel>[];

  @override
  void initState() {
    getImcs();
    super.initState();
  }

  void getImcs() async {
    _imcs = await imcRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Calculadora"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Wrap(
                    children: [
                      const Text("Nome"),
                      TextField(
                        controller: nomeController,
                      ),
                      const Text("Peso"),
                      TextField(
                        controller: pesoController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text("Altura"),
                      TextField(
                        controller: alturaController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        onPressed: () async {
                          var imc = calcularIMCC(
                                  double.parse(alturaController.text),
                                  double.parse(pesoController.text))
                              .round();

                          await imcRepository.save(ImcModel(
                              0,
                              nomeController.text,
                              double.parse(alturaController.text),
                              double.parse(imc.toString()),
                              double.parse(pesoController.text)));

                          pesoController.text = "";
                          alturaController.text = "";
                          getImcs();
                          setState(() {});

                          // Colocar as infos na variavel imc e mostrar na tela
                          Navigator.pop(context);
                        },
                        child: const Text("Calcular e Salvar"),
                      )
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     const Text("Altura"),
                  //     TextField(controller: alturaController)
                  //   ],
                  // )
                ),
              );
              // return const
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _imcs.length,
          itemBuilder: (context, index) {
            var imcss = _imcs[index];

            return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Nome",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(imcss.nome,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700))
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Peso",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(imcss.peso.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Altura",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(imcss.altura.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "IMC",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(imcss.imc.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700))
                        ],
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
