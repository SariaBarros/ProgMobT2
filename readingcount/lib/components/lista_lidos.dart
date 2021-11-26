import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ListaLidos extends StatelessWidget {
  const ListaLidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final livroDAO = Provider.of<LivroDAO>(context, listen: false);
    final loginManager = Provider.of<LoginManager>(context, listen: false);

    return Column(
      children: [
        const SizedBox(height: 16.0),
        const Text(
          'Livros lidos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: livroDAO.getLivrosUsuario(loginManager.uid!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return _buildLista(snapshot.data!.docs);
            }
          },
        )
      ],
    );
  }

  Widget _buildLista(List<DocumentSnapshot>? livros) {
    if (livros == null) {
      return const Text("Nenhum livro cadastrado");
    }

    return Column(
        children: livros
            .where((livro) => livro.get('lido'))
            .map((livro) => _buildCard(livro))
            .toList());
  }

  Widget _buildCard(DocumentSnapshot livro) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                livro.get('titulo'),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              Text(
                livro.get('autor'),
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Checkbox(
              value: livro.get('lido'),
              onChanged: (valor) {
                livro.reference.update({"lido": valor});
              })
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
