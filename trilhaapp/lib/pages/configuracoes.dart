import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class COnfiguracoesPage extends StatefulWidget {
  const COnfiguracoesPage({super.key});

  @override
  State<COnfiguracoesPage> createState() => _COnfiguracoesPageState();
}

class _COnfiguracoesPageState extends State<COnfiguracoesPage> {
  late SharedPreferences storage;

  late String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool isDark = false;
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  final CHAVE_NOME_USUARIO = "chave_altura";
  final CHAVE_ALTURA = "chave_altura";
  final CHAVE_RECEBE_NOTIFICACOES = "CHAVE_RECEBE_NOTIFICACOES";
  final CHAVE_ISDARK = "CHAVE_ISDARK";

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberPushNotification =
          storage.getBool(CHAVE_RECEBE_NOTIFICACOES) ?? false;
      isDark = storage.getBool(CHAVE_ISDARK) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("COnfigurações")),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nomeUsuarioController,
                decoration: const InputDecoration(
                  hintText: "Nome de Usuario",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Altura",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
              title: const Text("Receber Notificação"),
              value: receberPushNotification,
              onChanged: (value) {
                setState(() {
                  receberPushNotification = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text("Usar Versão Escura"),
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
              },
            ),
            TextButton(
                onPressed: () async {
                  await storage.setString(
                      CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                  await storage.setDouble(CHAVE_ALTURA,
                      double.tryParse(alturaController.text) ?? 0);
                  await storage.setBool(
                      CHAVE_RECEBE_NOTIFICACOES, receberPushNotification);
                  await storage.setBool(CHAVE_ISDARK, isDark);
                  Navigator.pop(context);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
