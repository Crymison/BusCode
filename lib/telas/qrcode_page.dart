import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  String nomeAluno;
  QRCodePage(this.nomeAluno);
  //QRCodePage({Key? key}) : super(key: key);
  final String data = "123456";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR code"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          QrImage(
            data: nomeAluno,
            size: 200,
          )
        ],
      )),
    );
  }
}