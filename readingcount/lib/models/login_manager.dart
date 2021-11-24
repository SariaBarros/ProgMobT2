import 'package:flutter/material.dart';

class LoginManager extends ChangeNotifier {
  bool _logado = false;
  bool _tocouCadastro = false;

  bool get logado => _logado;
  bool get tocouCadastro => _tocouCadastro;

  void login() {
    _logado = true;
    notifyListeners();
  }

  void irParaCadastro() {
    _tocouCadastro = true;
    notifyListeners();
  }

  void sairCadastro() {
    _tocouCadastro = false;
    notifyListeners();
  }
}
