import 'package:flutter/material.dart';

import 'telas.dart';
import '../navigation/rotas.dart';

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
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    //tela 1
    TelaHome(),
    //tela 2
    TelaListaLeitura(),
    //tela 3
    TelaEstatistica(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple
            .shade200, //Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.book), label: 'Lista de leitura'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Estatística'),
        ],
      ),
    );
  }
}
