import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'usuario.dart';

class LoginManager extends ChangeNotifier {
  bool _tocouCadastro = false;
  final _auth = FirebaseAuth.instance;
  final CollectionReference _usuarioCollection =
      FirebaseFirestore.instance.collection('usuarios');

  bool get logado => _auth.currentUser != null;
  bool get tocouCadastro => _tocouCadastro;

  void cadastrar(String nome, String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      _criarUsuario(nome);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
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

  void _criarUsuario(String nome) {
    Usuario usuario = Usuario(
      nome: nome,
      uid: _auth.currentUser!.uid,
    );

    _usuarioCollection.add(usuario.toJson());
  }

  void logout() async {
    await _auth.signOut();
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

  Stream<QuerySnapshot> getUsuario() {
    Query query = _usuarioCollection
        .where("uid", isEqualTo: _auth.currentUser!.uid)
        .limit(1);
    return query.snapshots();
  }
}
