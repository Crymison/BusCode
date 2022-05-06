import 'package:flutter_application_1/classes/instituicao_classe.dart';

class InstituicaoRepository {
  static List<Instituicao> tabela = [
    Instituicao(
      id: 0,
      nome: 'Universidade Tecnológica Federal do Paraná',
      icone: 'imagens/UTFPRIcon.png',
      endereco: 'Cornélio',
      sigla: 'UTFPR',
      telefone: '43 9 0000-0000'),
    Instituicao(
      id: 1,
      nome: 'Universidade Estadual do Norte do Paraná',
      icone: 'imagens/UENPICon.png',
      endereco: 'Cornélio',
      sigla: 'UENP',
      telefone: '43 9 0000-0000'),
  ];
}