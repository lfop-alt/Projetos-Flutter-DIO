class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  getNome() {
    return _nome;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  getPeso() {
    return _peso;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  getAltura() {
    return _altura;
  }

  void setAltura(double altura) {
    _altura = altura;
  }
}
