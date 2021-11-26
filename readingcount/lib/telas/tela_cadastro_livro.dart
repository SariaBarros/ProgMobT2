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
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _autorController.dispose();
    super.dispose();
  }

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
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Novo livro',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    TextField(
                      controller: _tituloController,
                      decoration: const InputDecoration(
                        labelText: 'Nome do Livro',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _autorController,
                      decoration: const InputDecoration(
                        labelText: 'Autor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text('Foto aqui')
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Livro livro = Livro(
                    autor: _autorController.text,
                    titulo: _tituloController.text,
                    usuarioUid:
                        Provider.of<LoginManager>(context, listen: false)
                            .usuario!
                            .uid,
                  );
                  Provider.of<LivroDAO>(context, listen: false)
                      .salvarLivro(livro);
                  Provider.of<AppStateManager>(context, listen: false)
                      .setTocouCadastroLivro(false);
                },
                child: const Text('Registrar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
