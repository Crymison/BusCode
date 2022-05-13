import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/classes/instituicao_classe.dart';
import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';

class Instituicao_db {
  final tabelaInstituicao = InstituicaoRepository.tabela;
  static List<Instituicao> faculdades = [];
  var conta = 0;

  buscarInstituicao() async {
    var colecao = FirebaseFirestore.instance.collection('Instituicao');
    var todasInstituicao = await colecao.get();

    for (var doc in todasInstituicao.docs) {
      Instituicao instituicao = Instituicao(
        id: doc['id'],
        nome: doc['nome'],
        icone: doc['icone'],
        endereco: doc['endereco'],
        sigla: doc['sigla'],
        telefone: doc['telefone']
      );
      faculdades.add(instituicao);
    }
  }

  quantidadeInstituicao() async {

    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var todasInstituicao = await colecao.get();
    var quantidade = 0;

    for (var doc in todasInstituicao.docs) {
      if (doc['tipoid'] == 1 && doc['instituicao'].toString() == 'Universidade Tecnológica Federal do Paraná'){
        quantidade++;
      }
    }
    return quantidade;
  }
}
