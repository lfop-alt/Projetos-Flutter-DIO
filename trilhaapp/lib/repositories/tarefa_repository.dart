import 'package:trilhaapp/model/tarefas.dart';

class TarefaRepository {
  final List<Tarefas> _tarefas = [];

  Future<void> adicionar(Tarefas tarefa) async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    _tarefas.where((element) => element.id == id).first.concluido = concluido;
  }

  Future<List<Tarefas>> listarTarefas() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    return _tarefas;
  }

  Future<List<Tarefas>> listarTarefasNaoConcluidas() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    return _tarefas.where((element) => element.concluido).toList();
  }

  Future<void> removeTarefas(String id) async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    _tarefas.remove(_tarefas.where((element) => element.id == id).first);
  }
}
