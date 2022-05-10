import 'package:flutter/material.dart';
import 'package:flutter_application_1/servicos/auth_servicos.dart';
import 'package:flutter_application_1/telas/login_page.dart';
import 'package:flutter_application_1/telas/qrcode_page.dart';
import 'package:flutter_application_1/telas/noticias_aluno_page.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_1/classes/aluno_classe.dart';
// import 'package:flutter_application_1/repositorios/aluno_repositorio.dart';
// import 'package:flutter_application_1/repositorios/instituicao_repositiro.dart';

class UsuarioMainPage extends StatefulWidget {
  //receber email aluno final.....
  const UsuarioMainPage({ Key? key }) : super(key: key);

  @override
  State<UsuarioMainPage> createState() => _UsuarioMainPageState();
}

class _UsuarioMainPageState extends State<UsuarioMainPage>{
  
  // final Aluno _aluno = AlunoRepository.select(email);

  @override
  Widget build(BuildContext context){

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF13818D), Color(0xFF070C3B)]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('BusCode'),
          leading: IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            alignment: AlignmentDirectional.centerStart,
            onPressed: () => context.read<AuthService>().logout(),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => LoginPage()
              //   )
              // );
          ),
          backgroundColor: Color(0xFF13818D),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoticiasUsuarioPage())
                );
              },
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset('imagens/fotousuario.jpg', width: 150,),
                    borderRadius: const BorderRadius.all(Radius.circular(150)),
                    ),
                ]
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Jorel da Silva Pereira Antunes Coelho',  /*tabela[Aluno].nome_aluno.toString()*/
                    style: TextStyle(fontSize: 20),
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Icon(Icons.email),
                      const Text('Email:', style: TextStyle(fontSize: 18)),
                      Text('jorel@hotmail.com', style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [/*person_pin*/
                      Icon(Icons.assignment_ind),
                      const Text('RG:', style: TextStyle(fontSize: 18)),
                      Text('2355572-7', style: TextStyle(fontSize: 15))
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Icon(Icons.school),
                      const Text('Instituição:', style: TextStyle(fontSize: 18)),
                      Text('Universidade Tecnológica Federal do Paraná', style: TextStyle(fontSize: 15))
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children:[
                      Icon(Icons.phone),
                      const Text('Telefone para Contato:', style: TextStyle(fontSize: 18)),
                      Text('(43) 90000-0000', style: TextStyle(fontSize: 15))
                    ],
                    
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 60, right: 30, left: 30),
                child: ElevatedButton(
                  onPressed: () {//ARRUMAR AQUI PARA FAZER QR CODE
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QRCodePage())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.qr_code, color: Colors.black),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: const Text('Abrir QR Code',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ), 
                ),
              ),
          ],
        ),
      )
    );
  }
}