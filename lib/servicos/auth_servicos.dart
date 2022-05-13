import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception{
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{

  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  login(String email, String senha) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);      
      _getUser(); 
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found'){
        throw AuthException('Email não encontrado!');
      }else if(e.code == 'wrong-passowrd'){
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async{
    await _auth.signOut();
    _getUser();
  }
}