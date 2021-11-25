import 'package:flutter/Material.dart';

class Aba {
  static const int home = 0;
  static const int listaLeitura = 1;
  static const int estatiscas = 2;
}

class AppStateManager extends ChangeNotifier {
  int _indiceAba = Aba.home;
  bool _tocouCadastroDeLivro = false;

  get abaSelecionada => _indiceAba;
  get exibirCadastroLivro => _tocouCadastroDeLivro;

  void irParaAba(int indice) {
    _indiceAba = indice;
    notifyListeners();
  }

  void setTocouCadastroLivro(bool valor) {
    _tocouCadastroDeLivro = valor;
    notifyListeners();
  }
}
