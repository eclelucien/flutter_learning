import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerTexto = TextEditingController();
  String _texto = "Nada ainda";

  _salvar() async {
    String valorDigitado = _controllerTexto.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("Operacão (salvar): $valorDigitado");
  }

  _recuperar() {}

  _remover() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Text(_texto, style: TextStyle(fontSize: 20)),
            ),
            TextField(
              controller: _controllerTexto,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite Algo"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _salvar,
                  child: Text("Salvar", style: TextStyle(fontSize: 15)),
                ),
                ElevatedButton(
                  onPressed: _recuperar,
                  child: Text(
                    "Recuperar",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                ElevatedButton(
                  onPressed: _remover,
                  child: Text(
                    "Remover",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
