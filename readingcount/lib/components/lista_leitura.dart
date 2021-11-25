import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class ListaLeitura extends StatelessWidget {
  const ListaLeitura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final livroDAO = Provider.of<LivroDAO>(context, listen: false);

    return Column(
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lista de leitura",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<AppStateManager>(context, listen: false)
                      .setTocouCadastroLivro(true);
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: livroDAO.getLivros(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return _buildLista(snapshot.data!.docs);
            }
          },
        ),
      ],
    );
  }

  Widget _buildLista(List<DocumentSnapshot>? livros) {
    if (livros == null) {
      return const Text("Nenhum livro cadastrado");
    }

    return Column(
      children:
          livros.map((livro) => _buildCard(Livro.fromSnapshot(livro))).toList(),
    );
  }

  Widget _buildCard(Livro livro) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
      child: Text(livro.titulo),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
