import 'package:cloud_firestore/cloud_firestore.dart';
import 'livro.dart';

class LivroDAO {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("livros");

  void salvarLivro(Livro livro) {
    collection.add(livro.toJson());
  }

  Stream<QuerySnapshot> getLivros() {
    return collection.snapshots();
  }
}