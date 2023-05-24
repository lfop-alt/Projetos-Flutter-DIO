import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Center(
              child: Image.network(
                "https://hermes.digitalinnovation.one/assets/diome/logo-full.svg",
                width: 150,
                height: 100,
              ),
            ),
          ),
          Container(), //email
          Container(), // senha
          Container(), // login
          Container(), // cadastro e esqueceu a senha
        ],
      ),
    );
  }
}
