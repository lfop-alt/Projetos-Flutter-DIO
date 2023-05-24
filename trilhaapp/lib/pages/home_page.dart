import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  var quantidadeDeClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meu Primeiro App",
          // style: GoogleFonts.pacifico(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quantidadeDeClicks++;
            numeroGerado =
                GeradorNumeroAleatorioServices.gerarNumeroAleatorio(100);
          });
        },
        child: const Icon(Icons.numbers),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Foi Clicado $quantidadeDeClicks vezes",
            style: GoogleFonts.acme(fontSize: 20),
          )),
          Center(
              child: Text(
            "O numero gerado foi: $numeroGerado",
            style: GoogleFonts.acme(fontSize: 20),
          )),
        ],
      ),
    );
  }
}
