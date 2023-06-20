class ImcModel {
  int _id = 0;
  String _nome = "";
  double _altura = 0;
  double _peso = 0;
  double _imc = 0;

  ImcModel(this._id, this._nome, this._altura, this._imc, this._peso);

  int get id => _id;

  String get nome => _nome;

  double get altura => _altura;

  double get peso => _peso;

  double get imc => _imc;

  set id(int id) => _id = id;

  set nome(String nome) => _nome = nome;

  set altura(double altura) => _altura = altura;

  set peso(double peso) => _peso = peso;

  set imc(double imc) => _imc = imc;
}
