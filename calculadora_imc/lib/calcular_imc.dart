class CalcularImc {
  calcular(double peso, double altura) {
    return peso / (altura * altura);
  }

  classificar_imc(double imc) {
    if (imc < 16) {
      return ("Magreza Grave");
    } else if (imc >= 16 && imc < 17) {
      return ("Magreza Moderada");
    } else if (imc >= 17 && imc < 18.5) {
      return ("Magreza Leve");
    } else if (imc >= 18.5 && imc < 25) {
      return ("Saudavel");
    } else if (imc >= 25 && imc < 30) {
      return ("Sobrepeso");
    } else if (imc >= 30 && imc < 35) {
      return ("Obesidade Grau I");
    } else if (imc >= 35 && imc < 40) {
      return ("Obesidade Grau II (Severa)");
    } else if (imc > 40) {
      return ("Obesidade Grau III (Mórbida)");
    }
  }
}
