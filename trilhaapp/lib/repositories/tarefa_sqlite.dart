import 'package:trilhaapp/model/database_sqlite.dart';
import 'package:trilhaapp/model/tarefa_model_sqlite.dart';

class TarefaSQLiteRepository {
  // buscar itens com o sqlite
  Future<List<TarefaModelSLite>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefaModelSLite> tarefas = [];
    var db = await DatabaseSQLite().getDatabase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? "SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0"
        : 'SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(TarefaModelSLite(int.parse(element["id"].toString()),
          element["descricao"].toString(), element["concluido"] == 1));
    }
    return tarefas;
  }

  // adicionar itens com sqlite
  Future<void> salvar(TarefaModelSLite tarefaModelSLite) async {
    var db = await DatabaseSQLite().getDatabase();
    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)',
        [tarefaModelSLite.descricao, tarefaModelSLite.concluido]);
  }

  // atualizar itens com sqlite
  Future<void> update(TarefaModelSLite tarefaModelSLite) async {
    var db = await DatabaseSQLite().getDatabase();
    await db.rawInsert(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaModelSLite.descricao,
      tarefaModelSLite.concluido ? 1 : 0,
      tarefaModelSLite.id
    ]);
  }

  // deletar item com sqlite
  Future<void> remover(int id) async {
    var db = await DatabaseSQLite().getDatabase();
    await db.rawInsert('DELETE tarefas WHERE id = ?', [id]);
  }
}
