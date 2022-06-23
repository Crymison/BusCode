import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';

class NoticiasUsuarioPage extends StatefulWidget {
  const NoticiasUsuarioPage({Key? key}) : super(key: key);

  @override
  State<NoticiasUsuarioPage> createState() => _NoticiasUsuarioPageState();
}

class _NoticiasUsuarioPageState extends State<NoticiasUsuarioPage> {
  @override
  Widget build(BuildContext context) {

    final tabela = Noticia_db.tabela;

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF13818D), Color(0xFF070C3B)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Noticias'),
              backgroundColor: Color(0xFF13818D),
            ),
            body: ListView.separated(
              itemBuilder: (BuildContext context, int Noticia) {
                return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(tabela[Noticia].titulo_noticia,
                        style: const TextStyle(
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
            )));
  }
}