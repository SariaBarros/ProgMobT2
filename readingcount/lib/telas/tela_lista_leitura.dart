import 'package:flutter/material.dart';
import '../components/lista_lidos.dart';
import '../components/lista_leitura.dart';

class TelaListaLeitura extends StatelessWidget {
  const TelaListaLeitura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListaLeitura(),
        ListaLidos(),
      ],
    );
  }
}
