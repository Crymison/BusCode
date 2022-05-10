import 'package:flutter/material.dart';
import 'package:flutter_application_1/servicos/auth_check.dart';
import 'package:flutter_application_1/telas/login_page.dart';


class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusCode',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF13818D)),
        colorScheme: ColorScheme.light().copyWith(
        primary: Colors.white,
        ),
      ),
      home: AutchCheck(),
    );
  }
}