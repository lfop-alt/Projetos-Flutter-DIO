import 'package:calculadora_imc/src/pages/calculadora_imc.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculadoraImc(),
    );
  }
}
