import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsuarioDAO extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  bool get isLogado => auth.currentUser != null;
  String? get usuarioID => auth.currentUser?.uid;
  String? get email => auth.currentUser?.email;

  void cadastrar(String email, String senha) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String senha) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
    notifyListeners();
  }
}
