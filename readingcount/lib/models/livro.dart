import 'package:cloud_firestore/cloud_firestore.dart';

class Livro {
  final String titulo;
  final String autor;
  final String usuarioUid;
  bool lido;

  DocumentReference? reference;

  Livro({
    required this.titulo,
    required this.autor,
    required this.usuarioUid,
    this.lido = false,
  });

  factory Livro.fromJson(Map<dynamic, dynamic> json) => Livro(
        autor: json['autor'] as String,
        titulo: json['titulo'] as String,
        usuarioUid: json['usuarioUid'] as String,
        lido: json['lido'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'autor': autor,
        'titulo': titulo,
        'usuarioUid': usuarioUid,
        'lido': lido,
      };

  factory Livro.fromSnapshot(DocumentSnapshot snapshot) {
    final livro = Livro.fromJson(snapshot.data() as Map<String, dynamic>);
    livro.reference = snapshot.reference;
    return livro;
  }
}
