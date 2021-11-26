import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../telas/cronometro.dart';
import '../models/models.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final livroDAO = Provider.of<LivroDAO>(context);
    final loginManager = Provider.of<LoginManager>(context);

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 64.0),
            _buildGreeting(loginManager.usuario),
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
            loginManager.uid != null
                ? _buildCards(livroDAO.getLivrosNaoLidos(loginManager.uid!))
                : const CircularProgressIndicator(),
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
      ),
    ]);
  }

  Widget buildCard() => Material(
        color: Colors.purple.shade200,
        child: InkWell(
            onTap: () => {
                  print('oiii'),
                },
            child: Container(
              width: 150,
              height: 100,
            )),
      );
  // Widget buildCard() => Container(
  //       width: 150,
  //       height: 100,
  //       color: Colors.purple.shade200,
  //       child: GestureDetector(
  //         onTap: () {
  //           print('oi');
  //         },
  //       ),
  //     );

  Widget _buildGreeting(Usuario? usuario) {
    if (usuario == null) {
      return const CircularProgressIndicator();
    }

    return Text(
      "Olá " + usuario.nome + "!",
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
          children: const [
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

  Widget _buildCards(Stream<QuerySnapshot> livros) {
    return StreamBuilder<QuerySnapshot>(
      stream: livros,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text("Nenhum livro na lista de leitura."));
          }

          return SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => _buildCardLivro(
                  Livro.fromSnapshot(snapshot.data!.docs[index])),
              separatorBuilder: (context, index) => const SizedBox(
                width: 20.0,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildCardLivro(Livro livro) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            livro.titulo,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Text(
            livro.autor,
            style: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.white),
          ),
        ],
      ),
      width: 150.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.purple,
      ),
    );
  }
}
