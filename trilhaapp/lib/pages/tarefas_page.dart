import 'package:flutter/material.dart';

import '../model/tarefa_model_sqlite.dart';
import '../repositories/tarefa_sqlite.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  TextEditingController descricaoController = TextEditingController();

  TarefaSQLiteRepository tarefaSQLiteRepository = TarefaSQLiteRepository();
  var _tarefas = const <TarefaModelSLite>[];
  var naoConcluidos = false;

  @override
  void initState() {
    getTarefas();
    super.initState();
  }

  void getTarefas() async {
    _tarefas = await tarefaSQLiteRepository.obterDados(naoConcluidos);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
          showDialog(
            context: context,
            builder: (context) {
              return (AlertDialog(
                title: const Text("Adicione uma tarefa"),
                content: TextField(
                  controller: descricaoController,
                ),
                // colocar os botoes de cancelar ou salvar
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                      onPressed: () async {
                        await tarefaSQLiteRepository.salvar(TarefaModelSLite(
                            0, descricaoController.text, false));
                        Navigator.pop(context);
                        getTarefas();
                        setState(() {});
                      },
                      child: const Text("Salvar"))
                ],
              ));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Apenas não concluidos"),
                Switch(
                  value: naoConcluidos,
                  onChanged: (value) {
                    naoConcluidos = value;
                    getTarefas();
                  },
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  var tarefaG = _tarefas[index];
                  return Dismissible(
                    key: Key(tarefaG.descricao),
                    onDismissed: (direction) async {
                      tarefaSQLiteRepository.remover(tarefaG.id);
                      getTarefas();
                    },
                    child: ListTile(
                      title: Text(tarefaG.descricao),
                      trailing: Switch(
                        value: tarefaG.concluido,
                        onChanged: (value) async {
                          tarefaG.concluido = value;
                          tarefaSQLiteRepository.update(tarefaG);
                          getTarefas();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
