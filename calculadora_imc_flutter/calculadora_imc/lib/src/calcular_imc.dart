double calcularIMCC(double altura, double peso) {
  double imc = peso / (altura * altura);

  if (imc < 16) {
    return imc;
  } else if (imc > 16 && imc < 17) {
    return imc;
  } else if (imc > 17 && imc < 18.5) {
    return imc;
  } else if (imc > 18.5 && imc < 25) {
    return imc;
  } else if (imc > 25 && imc < 30) {
    return imc;
  } else if (imc > 30 && imc < 35) {
    return imc;
  } else if (imc > 35 && imc < 40) {
    return imc;
  } else if (imc >= 40) {
    return imc;
  }

  return 0;
}
