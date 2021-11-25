import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'telas.dart';
import '../navigation/rotas.dart';
import '../models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  static MaterialPage page() {
    return MaterialPage(
      name: Rotas.home,
      key: ValueKey(Rotas.home),
      child: const Home(),
    );
  }
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    const TelaHome(),
    TelaListaLeitura(),
    const TelaEstatistica(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return Scaffold(
        body: pages[appStateManager.abaSelecionada],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple
              .shade200, //Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: appStateManager.abaSelecionada,
          onTap: appStateManager.irParaAba,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Lista de leitura',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Estatística',
            ),
          ],
        ),
      );
    });
  }
}
