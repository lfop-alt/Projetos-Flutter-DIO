import 'dart:convert';
import 'dart:io';

class InputDeDados {
  InputDeDados();

  inputDoTexto(textoI) {
    try {
      print(textoI);
      var input = stdin.readLineSync(encoding: utf8);
      return input;
    } catch (e) {
      throw Exception("Erro: $e");
    }
  }
}
