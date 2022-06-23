import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/repositorios/noticia_db.dart';
import 'package:flutter_application_1/telas/login_page.dart';
import 'package:flutter_application_1/telas/qrcode_page.dart';
import 'package:flutter_application_1/telas/noticias_aluno_page.dart';
import '../classes/globals.dart' as globals;

class UsuarioMainPage extends StatefulWidget {
  Aluno aluno;
  UsuarioMainPage({Key? key, required this.aluno}) : super(key: key);
  @override
  State<UsuarioMainPage> createState() => _UsuarioMainPageState();
}

class _UsuarioMainPageState extends State<UsuarioMainPage> {
  @override
  Widget build(BuildContext context) {
    Noticia_db teste = Noticia_db();
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF13818D), Color(0xFF070C3B)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('BusCode'),
            leading: IconButton(
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            backgroundColor: Color(0xFF13818D),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: () async {
                  if (globals.contadorAluno) {
                    await teste.buscarNoticia();
                    globals.contadorAluno = false;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoticiasUsuarioPage()));
                },
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            widget.aluno.icone.toString(),
                            width: 150,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(150)),
                        ),
                      ])),
              Row(
                // NOME DO ALUNO
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        widget.aluno.nome_aluno.toString(),
                        style: TextStyle(fontSize: 10),
                      )),
                ],
              ),
              Row(
                // EMAIL
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Icon(Icons.email),
                        Text('Email:', style: TextStyle(fontSize: 25)),
                        Text(widget.aluno.email_aluno.toString(),
                            style: TextStyle(fontSize: 10))
                      ],
                    ),
                  ),
                  Padding(
                    //RG
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Icon(Icons.assignment_ind),
                        Text('RG:', style: TextStyle(fontSize: 25)),
                        Text(widget.aluno.rg_aluno.toString(),
                            style: TextStyle(fontSize: 10))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                // INSTITUIÇÃO
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Icon(Icons.school),
                        Text('Instituição:', style: TextStyle(fontSize: 25)),
                        Text(widget.aluno.instituicao.toString(),
                            style: TextStyle(fontSize: 5))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                //TELEFONE
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Icon(Icons.phone),
                        Text('Telefone para Contato:',
                            style: TextStyle(fontSize: 23)),
                        Text(widget.aluno.telefone_aluno.toString(),
                            style: TextStyle(fontSize: 5))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 40, right: 30, left: 30),
                child: ElevatedButton(
                  onPressed: () {
                    //ARRUMAR AQUI PARA FAZER QR CODE
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QRCodePage(
                                widget.aluno.nome_aluno.toString())));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code, color: Colors.black),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'Abrir QR Code',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}