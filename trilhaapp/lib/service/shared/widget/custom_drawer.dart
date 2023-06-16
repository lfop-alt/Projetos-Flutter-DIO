import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../pages/dados_cadastrais.dart';
import '../../../pages/login_page.dart';
import '../../../pages/perfil_de_usuario_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Camera"),
                            leading: const Icon(Icons.camera_alt_outlined),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Galeria"),
                            leading: const Icon(Icons.photo_album_rounded),
                          )
                        ],
                      );
                    },
                  );
                },
                child: const CircleAvatar(child: Icon(Icons.person_2_outlined)),
              ),
              accountName: const Text("Luiz Fernando"),
              accountEmail: const Text("luiz@luiz.com")),
          const SizedBox(
            height: 15,
          ),
          const Divider(height: 15),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const perfilDeUsuarioPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: const Text(
                "Perfil",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const DadosCadastraisPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: const Text(
                "Cadastrar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  context: context,
                  builder: (context) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "Termo de uso e privacidade",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: const Text("Termo de uso e privacidade",
                    style: TextStyle(fontSize: 20)),
              )),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: const Text(
                "Configurações",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AlertDialog(
                title: const Text(
                  "Meu App",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: const Wrap(
                  children: [
                    Text("Você esta preste a sair do aplicativo"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Deseja proceguir ?")
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Não"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text("Sim"))
                ],
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: const Text(
                "Sair",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
