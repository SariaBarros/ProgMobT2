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

  Stream<QuerySnapshot> getLivrosUsuario(String usuarioUid) {
    return collection.where('usuarioUid', isEqualTo: usuarioUid).snapshots();
  }

  Stream<QuerySnapshot> getLivrosNaoLidos(String usuarioUid) {
    return collection
        .where('usuarioUid', isEqualTo: usuarioUid)
        .where('lido', isEqualTo: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getLivrosLidos(String usuarioUid) {
    return collection
        .where('usuarioUid', isEqualTo: usuarioUid)
        .where('lido', isEqualTo: true)
        .snapshots();
  }
}
