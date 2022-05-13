import 'package:flutter/material.dart';
import 'package:flutter_application_1/Telas/login_page.dart';
import 'package:flutter_application_1/classes/instituicao_classe.dart';
import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';
import 'package:flutter_application_1/telas/instituicao_detalhe_page.dart';
import 'package:flutter_application_1/telas/ler_qrcode_page.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';

class MotoristaMainPage extends StatelessWidget {
  const MotoristaMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabelaInstituicao = InstituicaoRepository.tabela;
    Noticia_db teste = Noticia_db();
    var contador = 1;
    
    mostrarInstituicao(Instituicao instituicao) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InstituicaoDetalhes(instituicao: instituicao),
          ));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Instituições'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeitorQRCodePage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () async {
              if (contador == 1) {
                await teste.buscarNoticia();
                contador = 0;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NoticiasMotoristaPage()));
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int instituicao) {
          return ListTile(
            leading: Image.asset(
              tabelaInstituicao[instituicao].icone,
              height: 50,
              width: 50,
            ),
            title: Text(tabelaInstituicao[instituicao].nome,
                style: TextStyle(fontSize: 16, color: Colors.black)),
            subtitle: Text(tabelaInstituicao[instituicao].telefone,
                style: TextStyle(fontSize: 14, color: Colors.black)),
            trailing:
                Text('1', style: TextStyle(fontSize: 20, color: Colors.black)),
            selected: false,
            selectedTileColor: Colors.indigo,
            onTap: () => mostrarInstituicao(tabelaInstituicao[instituicao]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabelaInstituicao.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        label: Icon(Icons.logout, color: Colors.white),
      ),
    );
  }
}
