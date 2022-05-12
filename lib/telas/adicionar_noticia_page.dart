import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/noticia_classe.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';
import 'package:flutter_application_1/repositorios/noticia_repositorio.dart';
import 'package:flutter_application_1/telas/motorista_principal_page.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';

class AdicionarNoticiaPage extends StatefulWidget {
  @override
  _AdicionarNoticiaPageState createState() => _AdicionarNoticiaPageState();
}

class _AdicionarNoticiaPageState extends State<AdicionarNoticiaPage> {
  final tabelaNoticias = NoticiaRepository.tabela;
  String titulo = '';
  String noticias = '';
  Noticia_db teste = new Noticia_db();
  final data = DateTime.now();
  var mes;
  var minutos;
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
          appBar: AppBar(
            title: Text('Nova Noticia'),
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
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (noticias.length >= 5 && titulo.length >= 5) {
                          /*Noticia noticia = new Noticia(
                            titulo_noticia: titulo,
                            texto_noticia: noticias,
                            data_noticia: '23-10-2002',
                            hora_noticia: '12:50',
                            tipo_noticia: 1
                          );
                          tabelaNoticias.add(noticia);
                          //tabelaNoticias.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MotoristaMainPage()
                            )
                          );*/
                          if (data.month < 10) {
                            mes = "0" + data.month.toString();
                          }

                          teste.adicionarNoticia(
                              titulo,
                              noticias,
                              /*data.day.toString() + "/" + mes,
                              data.hour.toString() +
                                  ":" +
                                  data.minute.toString(),
                              1)*/
                              data);
                          teste.buscarNoticia();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const NoticiasMotoristaPage()));
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