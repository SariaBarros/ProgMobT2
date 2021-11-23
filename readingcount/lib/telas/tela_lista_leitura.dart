import 'package:flutter/material.dart';
import 'package:readingcount/livro.dart';

class TelaListaLeitura extends StatelessWidget {
  TelaListaLeitura({Key? key}) : super(key: key);

  List<Livro> livros = [
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
    return Column(
      children: [
        Container(
          height: 450,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'LISTA DE LEITURA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 380,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: livros.length,
                  separatorBuilder: (context, _) => SizedBox(
                    height: 5,
                  ),
                  itemBuilder: (context, index) => buildCard(livros[index]),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'LIVROS LIDOS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: livros.length,
                  separatorBuilder: (context, _) => SizedBox(
                    height: 5,
                  ),
                  itemBuilder: (context, index) => buildCard(livros[index]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCard(Livro livro) => Container(
        width: double.infinity,
        height: 70,
        padding: EdgeInsets.all(10),
        child: Text(livro.nome),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      );
}
