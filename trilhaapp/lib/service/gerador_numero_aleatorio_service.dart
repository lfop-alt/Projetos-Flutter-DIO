import 'dart:math';

class GeradorNumeroAleatorioServices {
  static int gerarNumeroAleatorio(int maxnumber) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(maxnumber);
  }
}
