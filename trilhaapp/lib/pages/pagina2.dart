import 'package:flutter/material.dart';

class Pagina2Page extends StatefulWidget {
  const Pagina2Page({super.key});

  @override
  State<Pagina2Page> createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Imagem DARK",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Image(
          image: AssetImage("lib/images/wallpaperflare.com_wallpaper(1).jpg"),
        )
      ],
    );
  }
}
