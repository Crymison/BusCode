import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/classes/motorista_classe.dart';


class Usuario_db {

  static List<Aluno> tabela = [];

  verificaUsuario(email) async {
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var todosUsuario = await colecao.get();
    for (var doc in todosUsuario.docs) {
      if(doc['tipoid'] == 1 && doc['email'].toString() == email){
        return false;
      }else if(doc['tipoid'] == 0 && doc['email'].toString() == email){
        return true;
      }
    }
  }

  pegardadosUsuario(email) async{
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var pegardadosUsuario = await colecao.get(); 
    for(var doc in pegardadosUsuario.docs) {
      if(doc['email'].toString() == email && doc['tipoid'] == 1){
        Aluno aluno = Aluno(
          icone: doc['imagem'], 
          nome_aluno: doc['nome'], 
          email_aluno: doc['email'], 
          rg_aluno: doc['rg'], 
          telefone_aluno: doc['telefone'], 
          instituicao: doc['instituicao']
        );
        return aluno;
      }else if(doc['email'].toString() == email && doc['tipoid'] == 0){
        Motorista motorista = Motorista(
          nome_motorista: doc['nome'],
          email_motorista: doc['email']
        );
        return motorista;
      }
    }
  }

  pegardadosAlunos(insti) async{    
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var pegardadosUsuario = await colecao.get();  
    for(var doc in pegardadosUsuario.docs) {
      if(doc['tipoid'] == 1 && doc['instituicao'].toString() == insti){
        Aluno aluno = Aluno(
          icone: doc['imagem'], 
          nome_aluno: doc['nome'], 
          email_aluno: doc['email'], 
          rg_aluno: doc['rg'], 
          telefone_aluno: doc['telefone'], 
          instituicao: doc['instituicao']
        );
        tabela.add(aluno);
      }
    }
  }
}