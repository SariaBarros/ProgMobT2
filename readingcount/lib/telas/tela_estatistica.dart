import 'package:flutter/material.dart';

class TelaEstatistica extends StatelessWidget {
  const TelaEstatistica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 48),
            const Text(
              'Estatísticas de leitura',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Total de livros lidos',
                        style: TextStyle(fontSize: 24)),
                    Text('40',
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
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
