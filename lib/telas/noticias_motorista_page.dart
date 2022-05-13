import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorios/noticia_repositorio.dart';
import 'package:flutter_application_1/telas/adicionar_noticia_page.dart';
import 'package:flutter_application_1/telas/motorista_principal_page.dart';

class NoticiasMotoristaPage extends StatefulWidget {
  const NoticiasMotoristaPage({Key? key}) : super(key: key);

  @override
  State<NoticiasMotoristaPage> createState() => _NoticiasMotoristaPageState();
}

class _NoticiasMotoristaPageState extends State<NoticiasMotoristaPage> {
  @override
  Widget build(BuildContext context) {
    final tabela = NoticiaRepository.tabela;

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF13818D), Color(0xFF070C3B)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back ),
              onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MotoristaMainPage())
                );
              }
            ),
            title: const Text('Noticias'),
            backgroundColor: Color(0xFF13818D),
          ),
          body: ListView.separated(
            itemBuilder: (BuildContext context, int Noticia) {
              return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(tabela[Noticia].titulo_noticia,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    title: Text(tabela[Noticia].texto_noticia,
                        style: TextStyle(color: Colors.black)),
                    trailing: Text(tabela[Noticia].data_noticia,
                        style: TextStyle(color: Colors.black)),
                  ));
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, ___) => Divider(),
            itemCount: tabela.length,
          ),
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Color(0xFF13818D),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdicionarNoticiaPage()));
              },
              label: Icon(Icons.add, color: Colors.white)),
      ));
  }
}