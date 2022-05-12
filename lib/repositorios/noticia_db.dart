import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Noticia_db {
  adicionarNoticia(titulo, texto, data) async {
    //, hora, tipo) async {
    await Firebase.initializeApp();
    //print('teste');

    var colecao =
        FirebaseFirestore.instance.collection('Noticias'); //fora da classe
    colecao
        .doc()
        .set({
          'titulo': titulo,
          'texto': texto,
          'data': data,
          //'hora': hora,
          //'tipo': tipo,
        })
        .then((value) => print('Adicionado com sucesso'))
        .catchError((error) => print('Erro ao adicionar: $error'));
  }

  buscarNoticia() async {
    var colecao = FirebaseFirestore.instance.collection('Noticias');
    var todasNoticias = await colecao.get();

    for (var doc in todasNoticias.docs) {
      print(doc['titulo']);
    }
  }
}
