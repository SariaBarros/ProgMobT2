import 'package:flutter/material.dart';
import '../models/models.dart';

class ListaLeitura extends StatelessWidget {
  final List<Livro> livros;

  const ListaLeitura({Key? key, required this.livros}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 350,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: livros.length,
            separatorBuilder: (context, _) => const SizedBox(
              height: 5,
            ),
            itemBuilder: (context, index) => _buildCard(livros[index]),
          ),
        )
      ],
    );
  }

  Widget _buildCard(Livro livro) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
      child: Text(livro.nome),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
