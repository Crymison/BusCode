import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';

class AlunoRepository {
  static List<Aluno> tabela = [
    Aluno(
      icone: 'imagens/avatar1.png',
      nome_aluno: 'Jorel da Silva Pereira Antunes Coelho',
      email_aluno: 'jorel@hotmail.com',
      senha_aluno: 'Asdfg123#',
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
