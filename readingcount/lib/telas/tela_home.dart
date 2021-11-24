import 'package:flutter/material.dart';
import 'package:readingcount/telas/cronometro.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'OLÁ NOME!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Selecione o livro que você vai ler :)',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, _) => SizedBox(
                width: 8,
              ),
              itemBuilder: (context, index) => buildCard(),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          buildTemporizador(),
        ],
      ),
    );
  }

//temporario
  Widget buildCard() => Container(
        width: 150,
        height: 100,
        color: Colors.purple.shade200,
      );

  Widget buildTemporizador() => Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'INICIAR SESSÃO DE LEITURA',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Cronometro(),
          ],
        ),
      );
}
