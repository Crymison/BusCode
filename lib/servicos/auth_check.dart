import 'package:flutter/material.dart';
import 'package:flutter_application_1/servicos/auth_servicos.dart';
import 'package:flutter_application_1/telas/login_page.dart';
import 'package:flutter_application_1/telas/usuario_principal_page.dart';
import 'package:provider/provider.dart';

class AutchCheck extends StatefulWidget {
  const AutchCheck({ Key? key }) : super(key: key);

  @override
  State<AutchCheck> createState() => _AutchCheckState();
}

class _AutchCheckState extends State<AutchCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);


    if (auth.isLoading) 
      return loading();
    else if (auth.usuario == null)
      return LoginPage();
    else
      return UsuarioMainPage();
  }

  loading() {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}