import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String nome;
  final String uid;

  DocumentReference? reference;

  Usuario({required this.nome, required this.uid});

  factory Usuario.fromJson(Map<dynamic, dynamic> json) {
    return Usuario(nome: json['nome'] as String, uid: json['uid'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "nome": nome,
        "uid": uid,
      };

  factory Usuario.fromSnapshot(DocumentSnapshot snapshot) {
    final usuario = Usuario.fromJson(snapshot.data() as Map<String, dynamic>);
    usuario.reference = snapshot.reference;
    return usuario;
  }
}
