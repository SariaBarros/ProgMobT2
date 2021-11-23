import 'package:flutter/material.dart';

class TelaEstatistica extends StatelessWidget {
  const TelaEstatistica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ESTATÍSTICAS DE LEITURA',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: Text('Estatistica aqui'),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: Text('Estatistica aqui tbm'),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 150,
              width: double.infinity,
              child: Text('eu não gosto de padding, padding não gosta de mim'),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ));
  }
}
