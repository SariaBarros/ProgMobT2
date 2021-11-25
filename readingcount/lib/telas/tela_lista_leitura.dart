import 'package:flutter/material.dart';
import '../components/lista_lidos.dart';
import '../components/lista_leitura.dart';
import '../models/models.dart';

class TelaListaLeitura extends StatelessWidget {
  TelaListaLeitura({Key? key}) : super(key: key);

  final List<Livro> livros = [
    Livro(nome: 'nome1', autor: 'autor1'),
    Livro(nome: 'nome2', autor: 'autor2'),
    Livro(nome: 'nome3', autor: 'autor3'),
    Livro(nome: 'nome4', autor: 'autor4'),
    Livro(nome: 'nome5', autor: 'autor5'),
    Livro(nome: 'nome6', autor: 'autor6'),
    Livro(nome: 'nome7', autor: 'autor7'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListaLeitura(livros: livros),
        ListaLidos(livros: livros),
      ],
    );
  }
}
