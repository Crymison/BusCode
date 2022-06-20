import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/classes/noticia_classe.dart';

class Noticia_db {

  static List<Noticia> tabela = [];

  adicionarNoticia(titulo, texto, data) async {
    await Firebase.initializeApp();

    var colecao =
        FirebaseFirestore.instance.collection('Noticias'); 
    colecao
        .doc()
        .set({'titulo': titulo, 'texto': texto, 'data': data})
        .then((value) => print('Adicionado com sucesso'))
        .catchError((error) => print('Erro ao adicionar: $error'));

  }

  buscarNoticia() async {
    tabela = [];
    var colecao = FirebaseFirestore.instance.collection('Noticias');
    var todasNoticias = await colecao.get();
  
    for (var doc in todasNoticias.docs) {
      Noticia noticia = Noticia(
        titulo_noticia: doc['titulo'],
        texto_noticia: doc['texto'],
        data_noticia: doc['data'].toString(),
      );

      tabela.add(noticia);
    }
  }
}
