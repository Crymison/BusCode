import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/classes/instituicao_classe.dart';
import 'package:flutter_application_1/repositorios/aluno_repositorio.dart';
import 'package:flutter_application_1/repositorios/usuario_db.dart';
import 'package:flutter_application_1/telas/aluno_detalhe_page.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class InstituicaoDetalhes extends StatefulWidget {
  Instituicao instituicao;
  InstituicaoDetalhes({Key? key, required this.instituicao}) : super(key: key);

  @override
  State<InstituicaoDetalhes> createState() => _InstituicaoDetalhesState();
}

class _InstituicaoDetalhesState extends State<InstituicaoDetalhes> {
  @override
  Widget build(BuildContext context) {
    final tabelaAluno = Usuario_db.tabela;
    mostrarAlunos(Aluno alunos) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AlunoDetalhePage(alunos: alunos),
          ));
    }
    Usuario_db alu = Usuario_db();
    readQRCode() async {
      String code = await FlutterBarcodeScanner.scanBarcode(
        //interessante fazer try catch
        "#ffffff",
        "Cancelar",
        true,
        ScanMode.QR,
      );
      setState(() => code != '-1' ? code : 'Não valido');
      alu.adicionarAlunosDia(code);
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.instituicao.sigla.toString()),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: readQRCode,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoticiasMotoristaPage()
                )
              );
            },
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int aluno) {
          return ListTile(
            leading: Image.asset(tabelaAluno[aluno].icone),
            title: Text(tabelaAluno[aluno].nome_aluno, style: TextStyle(fontSize: 16, color: Colors.black)),
            subtitle: Text(tabelaAluno[aluno].telefone_aluno, style: TextStyle(fontSize: 14, color: Colors.black)),
            selected: false,
            selectedTileColor: Colors.indigo,
            onTap: () => mostrarAlunos(tabelaAluno[aluno]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabelaAluno.length,
      ),
    );
  }
}