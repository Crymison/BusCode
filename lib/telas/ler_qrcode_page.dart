import 'package:flutter/material.dart';

class LeitorQRCodePage extends StatelessWidget {
  const LeitorQRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Image.asset('imagens/QRCODE.png', width: 240,),
      ),
    );
  }
}