import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefas.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  TextEditingController descricaoController = TextEditingController();
  TarefaRepository tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefas>[];
  var naoConcluidos = false;

  @override
  void initState() {
    getTarefas();
    super.initState();
  }

  void getTarefas() async {
    if (naoConcluidos) {
      _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listarTarefas();
    }

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
                        await tarefaRepository.adicionar(
                            Tarefas(descricaoController.text, false));
                        Navigator.pop(context);
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Apenas não concluidos"),
                  Switch(
                    value: false,
                    onChanged: (value) {
                      naoConcluidos = value;
                      getTarefas();
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  var tarefaG = _tarefas[index];
                  return Dismissible(
                    key: Key(tarefaG.id),
                    onDismissed: (direction) async {
                      await tarefaRepository.removeTarefas(tarefaG.id);
                      getTarefas();
                    },
                    child: ListTile(
                      title: Text(tarefaG.descricao),
                      trailing: Switch(
                        value: tarefaG.concluido,
                        onChanged: (value) async {
                          await tarefaRepository.alterar(tarefaG.id, value);
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
