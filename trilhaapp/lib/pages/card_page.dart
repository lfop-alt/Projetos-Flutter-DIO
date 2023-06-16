import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        size: 64,
                      ),
                      Text(
                        "Meu card",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Text(
                    "É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de Conteúdo aqui, conteúdo aqui, fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Ler Mais",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        size: 64,
                      ),
                      Text(
                        "Meu card",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Text(
                    "É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de Conteúdo aqui, conteúdo aqui, fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Ler Mais",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        size: 64,
                      ),
                      Text(
                        "Meu card",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Text(
                    "É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de Conteúdo aqui, conteúdo aqui, fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Ler Mais",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
