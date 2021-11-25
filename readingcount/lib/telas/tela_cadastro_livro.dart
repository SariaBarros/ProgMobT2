import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/rotas.dart';
import '../models/models.dart';

class TelaCadastroLivro extends StatefulWidget {
  const TelaCadastroLivro({Key? key}) : super(key: key);

  @override
  _TelaCadastroLivroState createState() => _TelaCadastroLivroState();

  static MaterialPage page() {
    return MaterialPage(
      name: Rotas.cadastroLivro,
      key: ValueKey(Rotas.cadastroLivro),
      child: const TelaCadastroLivro(),
    );
  }
}

class _TelaCadastroLivroState extends State<TelaCadastroLivro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false)
                .setTocouCadastroLivro(false);
          },
        ),
        backgroundColor: Colors.purple.shade200,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'NOVO LIVRO',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Nome do Livro',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Autor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text('Foto aqui')
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Registrar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
