import 'package:calculadora_imc/calcular_imc.dart';
import 'package:calculadora_imc/pessoa.dart';

import 'input_dados.dart';

String calculate() {
  InputDeDados inputDeDados = InputDeDados();
  String nome = inputDeDados.inputDoTexto("Digite seu nome: ");
  String pesoInput = inputDeDados.inputDoTexto("Digite seu peso: ");
  double peso = double.parse(pesoInput);
  String alturaInput = inputDeDados.inputDoTexto("Digite sua altura: ");
  double altura = double.parse(alturaInput);

  Pessoa pessoa = Pessoa(nome, peso, altura);

  CalcularImc calcularImc = CalcularImc();

  double imc = calcularImc.calcular(pessoa.getPeso(), pessoa.getAltura());
  print(imc);

  return calcularImc.classificar_imc(imc);
}
