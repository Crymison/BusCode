import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';
import 'package:flutter_application_1/repositorios/noticia_repositorio.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';

class AdicionarNoticiaPage extends StatefulWidget {
  @override
  _AdicionarNoticiaPageState createState() => _AdicionarNoticiaPageState();
}

class _AdicionarNoticiaPageState extends State<AdicionarNoticiaPage> {
  final tabelaNoticias = NoticiaRepository.tabela;
  String titulo = '';
  String noticias = '';
  Noticia_db teste = Noticia_db();
  final data = DateTime.now();
  var mes;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF13818D), Color(0xFF070C3B)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoticiasMotoristaPage())
              );
            },
          ),
            title: const Text('Nova Noticia'),
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            color: Colors.transparent,
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 55,
                ),
                TextFormField(
                  onChanged: (text) {
                    titulo = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Titulo da Noticia',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  onChanged: (text) {
                    noticias = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Noticia', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (noticias.length >= 5 && titulo.length >= 5) {
                          if (data.month < 10) {
                            mes = "0" + data.month.toString();
                          }
                          var ajuda = data.day.toString() +
                              "/" +
                              data.month.toString() +
                              "/" +
                              data.year.toString();
                          teste.adicionarNoticia(titulo, noticias, ajuda);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NoticiasMotoristaPage()));
                        }
                      },
                      child: const Text('Adicionar',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}