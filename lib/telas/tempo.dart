import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorios/instituicao_db.dart';
import 'motorista_principal_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TempoPage extends StatefulWidget {
  const TempoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TempoPage> createState() => _TempoPage();
}

Future<List> pegarDados() async {
  var url = Uri.parse(
      'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/40143?apikey=R5a8Ss5Th8aj1WVRJUSgz9cSnAj1cnSq&language=pt-BR&metric=true HTTP/1.1');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Erro ao carregar dados');
  }
}

Instituicao_db facul = Instituicao_db();

fParaC(f) {
  var numero = double.parse(f.toString());
  assert(numero is double);
  var tamanhoA = numero;

  tamanhoA = (tamanhoA - 32) * (5 / 9);

  return tamanhoA.toStringAsFixed(1);
}

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
      body: FutureBuilder<List>(
        future: pegarDados(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index]['IconPhrase'].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    //snapshot.data![index]['Temperature']['Value'].toString(),,
                    fParaC(snapshot.data![index]['Temperature']['Value']
                        .toString()),
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
