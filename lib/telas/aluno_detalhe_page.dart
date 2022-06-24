import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/alunoD_classe.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';

class AlunoDetalhePage extends StatefulWidget {
  AlunoD alunos;
  AlunoDetalhePage({Key? key, required this.alunos}) : super(key: key);

  @override
  State<AlunoDetalhePage> createState() => _AlunoDetalhePageState();
}

class _AlunoDetalhePageState extends State<AlunoDetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF13818D), Color(0xFF070C3B)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color(0xFF13818D),
            ),
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              widget.alunos.icone,
                              width: 150,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(150)),
                          ),
                        ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          widget.alunos.nome_aluno.toString(),
                          style: TextStyle(fontSize: 30),
                        )),
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
                          const Text('Email:', style: TextStyle(fontSize: 25)),
                          Text(widget.alunos.email_aluno.toString(),
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          /*person_pin*/
                          Icon(Icons.assignment_ind),
                          const Text('RG:', style: TextStyle(fontSize: 25)),
                          Text(widget.alunos.rg_aluno.toString(),
                              style: TextStyle(fontSize: 20))
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Icon(Icons.school),
                          const Text('Instituição:',
                              style: TextStyle(fontSize: 25)),
                          Text(widget.alunos.instituicao.toString(),
                              style: TextStyle(fontSize: 18))
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Icon(Icons.phone),
                          const Text('Telefone para Contato:',
                              style: TextStyle(fontSize: 23)),
                          Text(widget.alunos.telefone_aluno.toString(),
                              style: TextStyle(fontSize: 18))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}
