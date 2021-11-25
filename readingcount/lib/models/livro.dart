import 'package:cloud_firestore/cloud_firestore.dart';

class Livro {
  final String titulo;
  final String autor;

  DocumentReference? reference;

  Livro({required this.titulo, required this.autor});

  factory Livro.fromJson(Map<dynamic, dynamic> json) =>
      Livro(autor: json['autor'] as String, titulo: json['titulo'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'autor': autor, 'titulo': titulo};

  factory Livro.fromSnapshot(DocumentSnapshot snapshot) {
    final livro = Livro.fromJson(snapshot.data() as Map<String, dynamic>);
    livro.reference = snapshot.reference;
    return livro;
  }
}
