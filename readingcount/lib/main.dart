import 'package:flutter/material.dart';
import 'telas/telas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _tocouRegistro = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'ReadingCount',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: Colors.black,
        secondary: Colors.pink,
      )),
      home: Navigator(
        pages: [
          MaterialPage(
            child: TelaLogin(
              setTocouRegistro: _setTocouRegistro,
            ),
          ),
          if (_tocouRegistro)
            MaterialPage(
              child: TelaCadastro(
                setTocouRegistro: _setTocouRegistro,
              ),
            ),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }

  void _setTocouRegistro(bool valor) {
    setState(() {
      _tocouRegistro = valor;
    });
  }
}
