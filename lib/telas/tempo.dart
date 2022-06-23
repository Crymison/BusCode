import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorios/instituicao_db.dart';

import 'motorista_principal_page.dart';

class TempoPage extends StatefulWidget {
  const TempoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TempoPage> createState() => _TempoPage();
}

Instituicao_db facul = Instituicao_db();

var aux = 0;
var aux2 = 2;

var numeroIcone = 2;
var cidade = 'Leópolis';
var temperaturaAtual = 24;
var temperaturaMaxima = 29;
var temperaturaMinima = 21;

class _TempoPage extends State<TempoPage> {
  @override
  Widget build(BuildContext context) {
    var ajuda = 0;
    var ajuda2 = 0;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Clima'),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () async {
                    ajuda = await facul.utfpr();
                    ajuda2 = await facul.uenp();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MotoristaMainPage(
                                  quantidade: ajuda,
                                  quantidade2: ajuda2,
                                )));
                  }),
            ]),
        body: Center(
            child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Image(
              image: AssetImage('imagens/$numeroIcone.png'),
              width: 100,
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              cidade,
              style: TextStyle(fontSize: 28, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  '${temperaturaAtual.toStringAsFixed(0)} °C',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ],
            ),
          ],
        )));
  }
}
