import 'package:flutter/material.dart';
import 'package:flutter_application_1/Telas/login_page.dart';
import 'package:flutter_application_1/classes/instituicao_classe.dart';
import 'package:flutter_application_1/repositorios/instituicao_db.dart';
import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';
import 'package:flutter_application_1/repositorios/usuario_db.dart';
import 'package:flutter_application_1/telas/instituicao_detalhe_page.dart';
import 'package:flutter_application_1/telas/ler_qrcode_page.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';
import '../classes/globals.dart' as globals;

class MotoristaMainPage extends StatefulWidget {
  var quantidade;
  MotoristaMainPage({Key? key, required this.quantidade}) : super(key: key);
 
  @override
  State<MotoristaMainPage> createState() => _MotoristaMainPageState();
}

var aux = 0;

class _MotoristaMainPageState extends State<MotoristaMainPage> {
  @override
  Widget build(BuildContext context) {

    Noticia_db teste = Noticia_db();
    Usuario_db alu = Usuario_db();
    Instituicao_db faculdadeMetodo = Instituicao_db();

    final faculdade = Instituicao_db.faculdades;
    final tabelaInstituicao = InstituicaoRepository.tabela;
    
    
    mostrarInstituicao(Instituicao instituicao) async {
      if(globals.contadorAlunoFaculdade){
        await alu.pegardadosAlunos(instituicao.nome.toString());
        globals.contadorAlunoFaculdade = false;
      }
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
              if (globals.contadorMotorista) {
                await teste.buscarNoticia();
                globals.contadorMotorista = false;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoticiasMotoristaPage()));
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int instituicao) {
          return ListTile(
            leading: Image.asset(
              faculdade[instituicao].icone,
              height: 50,
              width: 50,
            ),
            title: Text(faculdade[instituicao].nome,
                style: TextStyle(fontSize: 16, color: Colors.black)),
            subtitle: Text(faculdade[instituicao].telefone,
                style: TextStyle(fontSize: 14, color: Colors.black)),
            trailing: Text(widget.quantidade.toString(),
                style: TextStyle(fontSize: 20, color: Colors.black)),
            selected: false,
            selectedTileColor: Colors.indigo,
            onTap: () => mostrarInstituicao(faculdade[instituicao]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: faculdade.length,
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
