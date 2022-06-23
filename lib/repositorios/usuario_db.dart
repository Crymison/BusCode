import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/classes/alunoD_classe.dart';
import 'package:flutter_application_1/classes/aluno_classe.dart';
import 'package:flutter_application_1/classes/motorista_classe.dart';

class Usuario_db {
  static List<Aluno> tabela = [];

  //REPOSITORIO/BANCO AlUNOS
  nomesAlunos() async {
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var pegardadosUsuario = await colecao.get();
    var lista = [];
    List<Aluno> tabelaUsuario = [];

    for (var doc in pegardadosUsuario.docs) {
      Aluno aluno = Aluno(
        icone: doc['imagem'],
        nome_aluno: doc['nome'],
        email_aluno: doc['email'],
        rg_aluno: doc['rg'],
        telefone_aluno: doc['telefone'],
        instituicao: doc['instituicao'],
      );
      tabelaUsuario.add(aluno);
      lista.add(aluno.nome_aluno.toString());
    }
    return lista;
  }

  nomesAlunosDiarios() async {
    var colecao = FirebaseFirestore.instance.collection('UsuariosDiarios');
    var pegardadosUsuarioD = await colecao.get();
    var lista = [];
    List<AlunoD> tabelaUsuarioDiario = [];

    for (var doc in pegardadosUsuarioD.docs) {
      AlunoD alunoD = AlunoD(
          icone: doc['imagem'],
          nome_aluno: doc['nome'],
          email_aluno: doc['email'],
          rg_aluno: doc['rg'],
          telefone_aluno: doc['telefone'],
          instituicao: doc['instituicao'],
          data: doc['data']);
      tabelaUsuarioDiario.add(alunoD);
      lista.add(alunoD.nome_aluno.toString());
    }
    return lista;
  }

  tamanhoAlunosDiarios() async {
    var colecao = FirebaseFirestore.instance.collection('UsuariosDiarios');
    var pegardadosUsuarioD = await colecao.get();
    List<AlunoD> tabelaUsuarioDiario = [];

    for (var doc in pegardadosUsuarioD.docs) {
      AlunoD alunoD = AlunoD(
          icone: doc['imagem'],
          nome_aluno: doc['nome'],
          email_aluno: doc['email'],
          rg_aluno: doc['rg'],
          telefone_aluno: doc['telefone'],
          instituicao: doc['instituicao'],
          data: doc['data']);
      tabelaUsuarioDiario.add(alunoD);
    }
    var aux = tabelaUsuarioDiario.length;
    return aux;
  }

  dataAlunosDiarios() async {
    var colecao = FirebaseFirestore.instance.collection('UsuariosDiarios');
    var pegardadosUsuarioD = await colecao.get();
    var lista = [];
    List<AlunoD> tabelaUsuarioDiario = [];

    for (var doc in pegardadosUsuarioD.docs) {
      AlunoD alunoD = AlunoD(
          icone: doc['imagem'],
          nome_aluno: doc['nome'],
          email_aluno: doc['email'],
          rg_aluno: doc['rg'],
          telefone_aluno: doc['telefone'],
          instituicao: doc['instituicao'],
          data: doc['data']);
      tabelaUsuarioDiario.add(alunoD);
      lista.add(alunoD.data.toInt());
    }
    return lista;
  }

  //FUNÇÕES BANCO
  verificaUsuario(email) async {
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var todosUsuario = await colecao.get();
    for (var doc in todosUsuario.docs) {
      if (doc['tipoid'] == 1 && doc['email'].toString() == email) {
        return false;
      } else if (doc['tipoid'] == 0 && doc['email'].toString() == email) {
        return true;
      }
    }
  }

  pegardadosUsuario(email) async {
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var pegardadosUsuario = await colecao.get();
    for (var doc in pegardadosUsuario.docs) {
      if (doc['email'].toString() == email && doc['tipoid'] == 1) {
        Aluno aluno = Aluno(
            icone: doc['imagem'],
            nome_aluno: doc['nome'],
            email_aluno: doc['email'],
            rg_aluno: doc['rg'],
            telefone_aluno: doc['telefone'],
            instituicao: doc['instituicao']);
        return aluno;
      } else if (doc['email'].toString() == email && doc['tipoid'] == 0) {
        Motorista motorista = Motorista(
            nome_motorista: doc['nome'], email_motorista: doc['email']);
        return motorista;
      }
    }
  }

  pegardadosAlunos(insti) async {
    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var pegardadosUsuario = await colecao.get();
    for (var doc in pegardadosUsuario.docs) {
      if (doc['tipoid'] == 1 && doc['instituicao'].toString() == insti) {
        Aluno aluno = Aluno(
            icone: doc['imagem'],
            nome_aluno: doc['nome'],
            email_aluno: doc['email'],
            rg_aluno: doc['rg'],
            telefone_aluno: doc['telefone'],
            instituicao: doc['instituicao']);
        tabela.add(aluno);
      }
    }
  }

  adicionarAlunosDia(nome) async {
    final data = DateTime.now();

    var nomeDiario = await nomesAlunosDiarios();
    var tamanhoDiario = await tamanhoAlunosDiarios();
    var dataDiario = await dataAlunosDiarios();

    for (var i = 0; i < tamanhoDiario; i++) {
      if (dataDiario[i] != data.day.toInt()) {
        var cont = '$i';
        var bancoDelete = FirebaseFirestore.instance
            .collection("UsuariosDiarios")
            .doc(cont)
            .delete()
            .then(
              (value) => print("Document deleted"),
              onError: (e) => print("Error updating document $e"),
            );
      }
    }
    tamanhoDiario = await tamanhoAlunosDiarios();

    // Hack para transformar a variável do tipo dynamic em int
    var myInt = int.parse(tamanhoDiario.toString());
    assert(myInt is int);
    var tamanhoA = myInt++;

    List<Aluno> tabelas = [];

    var colecao = FirebaseFirestore.instance.collection('Usuarios');
    var pegardadosUsuario = await colecao.get();

    for (var doc in pegardadosUsuario.docs) {
      if (doc['tipoid'] == 1) {
        // TU TA FUDIDO  // ERRO 404 VSF
        Aluno aluno = Aluno(
            icone: doc['imagem'],
            nome_aluno: doc['nome'],
            email_aluno: doc['email'],
            rg_aluno: doc['rg'],
            telefone_aluno: doc['telefone'],
            instituicao: doc['instituicao']);
        tabelas.add(aluno);
      }
    }

    if (tamanhoDiario == 0) {
      for (var i = 0; i < tabelas.length; i++) {
        if (tabelas[i].nome_aluno == nome) {
          var colecao =
              FirebaseFirestore.instance.collection('UsuariosDiarios');
          colecao
              .doc(tamanhoA.toString())
              .set({
                'imagem': tabelas[i].icone,
                'nome': tabelas[i].nome_aluno,
                'email': tabelas[i].email_aluno,
                'rg': tabelas[i].rg_aluno,
                'telefone': tabelas[i].nome_aluno,
                'instituicao': tabelas[i].instituicao,
                'data': data.day.toInt(),
              })
              .then((value) => print('Adicionado com sucesso'))
              .catchError((error) => print('Erro ao adicionar: $error'));
        }
      }
    } else {
      var i = 0;
      var n = 0;

      while (i == 0 && n < tamanhoDiario) {
        if (nomeDiario[n] == nome) i = 1;
        n++;
      }

      if (i == 1) {
        print(" Usuário $nome já inserido ");
      } else {
        for (var i = 0; i < tabelas.length; i++) {
          if (tabelas[i].nome_aluno == nome) {
            var colecao =
                FirebaseFirestore.instance.collection('UsuariosDiarios');
            colecao
                .doc(tamanhoA.toString())
                .set({
                  'imagem': tabelas[i].icone,
                  'nome': tabelas[i].nome_aluno,
                  'email': tabelas[i].email_aluno,
                  'rg': tabelas[i].rg_aluno,
                  'telefone': tabelas[i].nome_aluno,
                  'instituicao': tabelas[i].instituicao,
                  'data': data.day.toInt(),
                })
                .then((value) => print('Adicionado com sucesso'))
                .catchError((error) => print('Erro ao adicionar: $error'));
          }
        }
      }
    }
  }
}
