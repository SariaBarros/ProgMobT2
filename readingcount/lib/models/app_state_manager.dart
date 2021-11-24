import 'package:flutter/cupertino.dart';

class Aba {
  static const int home = 0;
  static const int listaLeitura = 1;
  static const int estatiscas = 2;
}

class AppStateManager extends ChangeNotifier {
  int _indiceAba = Aba.home;

  get abaSelecionada => _indiceAba;

  void irParaAba(int indice) {
    _indiceAba = indice;
    notifyListeners();
  }
}
