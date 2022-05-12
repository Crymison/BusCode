import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/database/db_firestore.dart';
import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';
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
      final snapshot = await db.collection('usuarios/${auth.usuario!.uid}/dados').get(); //where para filtrar
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
      senha_aluno: '123456',
      rg_aluno: '2355572-7',
      telefone_aluno: '43 90000-0000',
      instituicao: InstituicaoRepository.tabela[0],
    ),
    Aluno(
      icone: 'imagens/avatar2.png',
      nome_aluno: 'Juandir dos Santos',
      email_aluno: 'jujuhl@hotmail.com',
      senha_aluno: 'juju123',
      rg_aluno: '2355572-7',
      telefone_aluno: '43 9430-0024',
      instituicao: InstituicaoRepository.tabela[1],
    ),
    Aluno(
      icone: 'imagens/avatar3.png',
      nome_aluno: 'Maria da Conceicao',
      email_aluno: 'maria333@hotmail.com',
      senha_aluno: '123#',
      rg_aluno: '2355572-7',
      telefone_aluno: '43 9342-0540',
      instituicao: InstituicaoRepository.tabela[1],
    )
  ];
}
