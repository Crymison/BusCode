import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/database/db_firestore.dart';
import 'package:flutter_application_1/servicos/auth_servicos.dart';

class AlunoRepository extends ChangeNotifier{

  List<Aluno> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;

  AlunoRepository({required this.auth}){
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readAlunos();
  }

  _startFirestore(){
    db = DBFirestore.get();
  }

  _readAlunos() async{
    if(auth.usuario != null && _lista.isEmpty){
      final snapshot = await db.collection('Alunos/${auth.usuario!.uid}/dados').get(); //where para filtrar
      snapshot.docs.forEach((doc){
        Aluno aluno = AlunoRepository.tabela.firstWhere((aluno) => aluno.nome_aluno == doc.get('nome'));
        _lista.add(aluno);
        notifyListeners();
      });
    }
  }

  static List<Aluno> tabela = [
    Aluno(
      icone: 'imagens/avatar1.png',
      nome_aluno: 'Gabriel',
      email_aluno: 'gabriel@hotmail.com',
      rg_aluno: '2355572-7',
      telefone_aluno: '43 90000-0000',
      instituicao: '0',
    ),
    Aluno(
      icone: 'imagens/avatar2.png',
      nome_aluno: 'Juandir dos Santos',
      email_aluno: 'jujuhl@hotmail.com',
      rg_aluno: '2355572-7',
      telefone_aluno: '43 9430-0024',
      instituicao: '1',
    ),
    Aluno(
      icone: 'imagens/avatar3.png',
      nome_aluno: 'Maria da Conceicao',
      email_aluno: 'maria333@hotmail.com',
      rg_aluno: '2355572-7',
      telefone_aluno: '43 9342-0540',
      instituicao: '1',
    )
  ];
}
