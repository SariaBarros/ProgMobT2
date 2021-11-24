import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginManager extends ChangeNotifier {
  bool _tocouCadastro = false;
  final _auth = FirebaseAuth.instance;

  bool get logado => _auth.currentUser != null;
  bool get tocouCadastro => _tocouCadastro;

  void cadastrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    sairCadastro();
    notifyListeners();
  }

  void login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
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
