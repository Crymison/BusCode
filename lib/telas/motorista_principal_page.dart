import 'package:flutter/material.dart';
import 'package:flutter_application_1/Telas/login_page.dart';
import 'package:flutter_application_1/classes/instituicao_classe.dart';
import 'package:flutter_application_1/repositorios/instituicao_db.dart';
import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';
import 'package:flutter_application_1/repositorios/usuario_db.dart';
import 'package:flutter_application_1/telas/instituicao_detalhe_page.dart';
import 'package:flutter_application_1/telas/noticias_motorista_page.dart';
import 'package:flutter_application_1/telas/tempo.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../classes/globals.dart' as globals;

class MotoristaMainPage extends StatefulWidget {
  var quantidade;
  var quantidade2;
  MotoristaMainPage(
      {Key? key, required this.quantidade, required this.quantidade2})
      : super(key: key);

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
      if (globals.contadorAlunoFaculdade) {
        await alu.pegardadosAlunos(instituicao.nome.toString());
        globals.contadorAlunoFaculdade = false;
        print(instituicao.nome);
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InstituicaoDetalhes(instituicao: instituicao),
          ));
    }

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

    tempo() {
      //avigator.push(context, MaterialPageRoute(builder: (_) => tempo()));
    }

    aux(Instituicao instituicao) {
      if (instituicao.nome == 'Universidade Tecnológica Federal do Paraná') {
        return widget.quantidade;
      } else if (instituicao.nome ==
          'Universidade Estadual do Norte do Paraná') {
        return widget.quantidade2;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Instituições'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: readQRCode,
          ),
          IconButton(
            icon: const Icon(Icons.wb_sunny),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TempoPage()));
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
            title: Text(faculdade[instituicao].nome, // Nome
                style: TextStyle(fontSize: 16, color: Colors.black)),
            subtitle: Text(faculdade[instituicao].telefone, // Telefone
                style: TextStyle(fontSize: 14, color: Colors.black)),
            trailing: Text(aux(faculdade[instituicao]).toString(), // Quantidade
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
