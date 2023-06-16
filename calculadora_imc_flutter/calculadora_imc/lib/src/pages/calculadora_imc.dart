import 'package:calculadora_imc/src/calcular_imc.dart';
import 'package:flutter/material.dart';

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key});

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  var pesoController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController();
  var imcs = [];

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
                        onPressed: () {
                          var imc = [];
                          imc.add(pesoController.text);
                          imc.add(alturaController.text);
                          // realizar o calculo do IMC
                          imc.add(calcularIMCC(
                                  double.parse(alturaController.text),
                                  double.parse(pesoController.text))
                              .round());

                          imcs.add(imc);
                          pesoController.text = "";
                          alturaController.text = "";
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
          itemCount: imcs.length,
          itemBuilder: (context, index) {
            var imcss = imcs[index];

            return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
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
                          Text(imcss[0],
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
                          Text(imcss[1],
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
                          Text(imcss[2].toString(),
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
