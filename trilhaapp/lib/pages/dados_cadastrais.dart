import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatelessWidget {
  const DadosCadastraisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Cadastrais"),
      ),
      body: const Center(
        child: Text("Dados cadastrais"),
      ),
    );
  }
}
