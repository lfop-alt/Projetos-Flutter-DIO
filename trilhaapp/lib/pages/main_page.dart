import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/tarefas_page.dart';

import '../service/shared/widget/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Meu App Fiis")),
        drawer: const CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                // scrollDirection: Axis.vertical,
                children: const [CardPage(), Pagina2Page(), TarefasPage()],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Page1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Page2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Tarefas",
                      icon: Icon(Icons.travel_explore_outlined))
                ])
          ],
        ),

        // Container(
        //   child: Center(
        //     child: FloatingActionButton(
        //       child: const Icon(Icons.person_add_alt_1_rounded),
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: ((context) => const DadosCadastraisPage())));
        //       },
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
