import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../telas/cronometro.dart';
import '../models/models.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario =
        Provider.of<LoginManager>(context, listen: false).getUsuario();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 64.0),
          StreamBuilder<QuerySnapshot>(
              stream: usuario,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildGreeting(snapshot.data!.docs.first);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Selecione o livro que você vai ler :)',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, _) => const SizedBox(
                width: 8,
              ),
              itemBuilder: (context, index) => buildCard(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          buildTemporizador(),
          const SizedBox(height: 50.0),
          OutlinedButton(
            child: const Text("Logout"),
            onPressed: () {
              Provider.of<LoginManager>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  Widget buildCard() => Container(
        width: 150,
        height: 100,
        color: Colors.purple.shade200,
      );

  Widget _buildGreeting(DocumentSnapshot snapshot) {
    return Text(
      "Olá " + Usuario.fromSnapshot(snapshot).nome + "!",
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

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
