import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorios/instituicao_db.dart';
import 'package:flutter_application_1/servicos/auth_servicos.dart';
import 'package:flutter_application_1/telas/motorista_principal_page.dart';
import 'package:flutter_application_1/telas/usuario_principal_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/repositorios/usuario_db.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool _isObscure = true;
  Usuario_db us = Usuario_db();

  Instituicao_db facul = Instituicao_db();
  var M;

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    var ajuda = 0;
    return Container(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 5),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF13818D), Color(0xFF070C3B)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset('imagens/Tema.png'),
                            width: 200,
                          )
                        ],
                      )),
                  const Text('BusCode',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -1,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: email,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          /*borderSide: BorderSide(color: Colors.red) nao esta funcionando*/),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Informe seu e-mail!';
                      } else if (!value.contains("@")) {
                        return "E-mail invalido, falta: @";
                      } else if (value.length < 5) {
                        return "Tamanho de e-mail invalido!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: _isObscure,
                    controller: senha,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.key, color: Colors.white),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if (value.length < 5) {
                        return "A senha tem que ter mais do que 5 caracteres";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        'Esqueceu a Senha?',
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        //FAZER! fase 2/3
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          login();
                          var a = await us.verificaUsuario(email.text);
                          email.clear;
                          senha.clear;
                          if (a) { // ERRO EMAIL
                            await facul.buscarInstituicao();
                            ajuda = await facul.quantidadeInstituicao();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MotoristaMainPage(
                                          quantidade: ajuda,
                                        )));
                          } else {
                            M = await us.pegardadosUsuario(email.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UsuarioMainPage(aluno: M)));
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.login, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
