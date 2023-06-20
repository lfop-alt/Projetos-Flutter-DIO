import 'package:calculadora_imc/src/model/imc_model.dart';
import 'package:calculadora_imc/src/repositories/database.dart';

class ImcRepository {
  Future<List<ImcModel>> obterDados() async {
    List<ImcModel> imcs = [];
    var db = await DataBase().getDatabase();
    var date =
        await db.rawQuery('SELECT id, nome, altura, peso, imc FROM imcs');
    for (var imc in date) {
      imcs.add(
        ImcModel(
          int.parse(imc["id"].toString()),
          imc["nome"].toString(),
          double.parse(imc["altura"].toString()),
          double.parse(imc["imc"].toString()),
          double.parse(
            imc["peso"].toString(),
          ),
        ),
      );
    }
    return imcs;
  }

  Future<void> save(ImcModel imcModel) async {
    var db = await DataBase().getDatabase();
    await db.rawInsert(
        'INSERT INTO imcs (nome, altura, imc, peso) values(?,?,?,?)',
        [imcModel.nome, imcModel.altura, imcModel.imc, imcModel.peso]);
  }
}
