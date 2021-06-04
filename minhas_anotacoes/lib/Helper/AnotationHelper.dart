import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:minhas_anotacoes/HomePage.dart';

class AnotationHelper {
  static final AnotationHelper _anotationHelper = AnotationHelper._internal();
  Database _db;

  factory AnotationHelper() {
    return _anotationHelper;
  }

  AnotationHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await _inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE anotacao(id INTEGER PRIMARY KEY AUTOINREMENT, titulo VARCHAR, descricao  TEXT, data DATETIME)";
    await db.execute(sql);
  }

  _inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "bano_minhas_anotacoes.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  _salvarAnotacao() {
    String titulo = _controllerTitulo.text;
    String descricao = _controllerDescricao.text;
  }
}
