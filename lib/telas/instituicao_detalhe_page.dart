import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/classes/instituicao_classe.dart';
import 'package:flutter_application_1/repositorios/aluno_repositorio.dart';
import 'package:flutter_application_1/telas/aluno_detalhe_page.dart';
import 'package:flutter_application_1/telas/ler_qrcode_page.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';


class InstituicaoDetalhes extends StatefulWidget {
  Instituicao instituicao;

  InstituicaoDetalhes({Key? key, required this.instituicao}) : super(key: key);

  @override
  State<InstituicaoDetalhes> createState() => _InstituicaoDetalhesState();
}

class _InstituicaoDetalhesState extends State<InstituicaoDetalhes> {
  @override
  Widget build(BuildContext context) {
    final tabelaAlunos = AlunoRepository.tabela;
    mostrarAlunos(Aluno alunos) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AlunoDetalhePage(alunos: alunos),
          ));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Alunos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LeitorQRCodePage()
                )
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NoticiasMotoristaPage()
                )
              );
            },
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int alunos) {
          return ListTile(
            leading: Image.asset(tabelaAlunos[alunos].icone),
            title: Text(tabelaAlunos[alunos].nome_aluno, style: TextStyle(fontSize: 16, color: Colors.black)),
            subtitle: Text(tabelaAlunos[alunos].telefone_aluno, style: TextStyle(fontSize: 14, color: Colors.black)),
            selected: false,
            selectedTileColor: Colors.indigo,
            onTap: () => mostrarAlunos(tabelaAlunos[alunos]), // tela do aluno
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabelaAlunos.length,
      ),
    );
  }
}