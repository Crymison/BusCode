import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/classes/noticia_classe.dart';
import 'package:flutter_application_1/repositorios/noticia_repositorio.dart';

class Noticia_db {
  final tabelaNoticias = NoticiaRepository.tabela;

  adicionarNoticia(titulo, texto, data) async {
    await Firebase.initializeApp();

    var colecao =
        FirebaseFirestore.instance.collection('Noticias'); //fora da classe
    colecao
        .doc()
        .set({
          'titulo': titulo,
          'texto': texto,
          'data': data
        })
        .then((value) => print('Adicionado com sucesso'))
        .catchError((error) => print('Erro ao adicionar: $error'));

    Noticia noticia = Noticia(
      titulo_noticia: titulo,
      texto_noticia: texto,
      data_noticia: data.toString(),
    );
    tabelaNoticias.add(noticia);
  }

  buscarNoticia() async {
    var colecao = FirebaseFirestore.instance.collection('Noticias');
    var todasNoticias = await colecao.get();
    var contadorAux = tabelaNoticias.length - 1;

    for (var doc in todasNoticias.docs) {
      Noticia noticia = Noticia(
        titulo_noticia: doc['titulo'],
        texto_noticia: doc['texto'],
        data_noticia: doc['data'].toString(),
      );

      if (noticia.data_noticia !=
              tabelaNoticias[contadorAux]
                  .data_noticia ||
          noticia.texto_noticia != tabelaNoticias[contadorAux].texto_noticia ||
          noticia.titulo_noticia !=
              tabelaNoticias[contadorAux].titulo_noticia) {
        tabelaNoticias.add(noticia);
      } else {
        contadorAux = 0;
      }
      contadorAux++;

      print("Tamanho de noticias no banco: ${todasNoticias.docs.length}");
      print("Contador atualizado: $contadorAux");
    }
  }
}