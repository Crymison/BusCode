import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Meu_aplicativo.dart';
import 'package:flutter_application_1/repositorios/aluno_repositorio.dart';
import 'package:flutter_application_1/servicos/auth_servicos.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(
          create: (context) => AlunoRepository(
                auth: context.read<AuthService>(),
              )),
    ], child: MeuAplicativo()),
  );
}
