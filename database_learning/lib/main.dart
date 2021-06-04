import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    title: "Database Lerning",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _recuperarBancoDados() async {
    final caminhoBancoDados =
        await getDatabasesPath(); //aqui criamos uma variavel para saber
    //em qual pasta que estara o nosso banco de dados
    final localBancoDados =
        join(caminhoBancoDados, "Banco.db"); //aqui estamos criando o arquivo
    // banco.db na pasta encontrado e guardamos esse loal numa variavel

    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      //aqui abrimos o nosso banco e criamos as tabelas
      //necessarias que vamos utilizar
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
      db.execute(sql);
    });

    return bd;

    // print("aberto: " + retorno.isOpen.toString());
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuarios = {"nome": "Un inconnu", "idade": "70"};

    int id = await bd.insert("usuarios", dadosUsuarios);
    print("ID do primeiro: $id");
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();

    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print("item id: " +
          usuario["id"].toString() +
          "nome: " +
          usuario["nome"] +
          "idade: " +
          usuario["idade"].toString());
    }
  }

  _recuperarUsuarioPeloId(int id) async {
    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.query("usuarios",
        columns: ["id", "nome", "idade"], where: "id = ?", whereArgs: [id]);

    for (var usuario in usuarios) {
      print("item id: " +
          usuario["id"].toString() +
          "nome: " +
          usuario["nome"] +
          "idade: " +
          usuario["idade"].toString());
    }
  }

  _excluirUsuarios(int id) async {
    Database bd = await _recuperarBancoDados();

    int retorno = await bd.delete("usuarios", where: "id = ?", whereArgs: [id]);
    print("Item removida $retorno");
  }

  _atualizarUsuarios(int id) async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuarios = {"nome ": " Neicul Ecle", "idade": 46};

    bd.update("usuarios", dadosUsuarios, where: "id = ?", whereArgs: [id]);
  }

  @override
  Widget build(BuildContext context) {
    _listarUsuarios();
    return Container();
  }
}
