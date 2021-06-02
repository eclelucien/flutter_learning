import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGazolina = new TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGazolina = double.tryParse(_controllerGazolina.text);

    if (precoAlcool == null || precoGazolina == null) {
      setState(() {
        _textoResultado =
            "Numero invalido, digite numeros maiores do  que 0 e com (.)";
      });
    } else {
      if ((precoAlcool / precoGazolina) >= 0.7) {
        setState(() {
          _textoResultado = "melhor abastecer comgasolina!";
        });
      } else {
        setState(() {
          _textoResultado = "melhor abastecer com gasolina!";
          _limparCampos();
        });
      }
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = " ";
    _controllerGazolina.text = " ";
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou gazolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  child: Image.asset('images/logo.png'),
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                ),
                Padding(
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Alcool, ex: 1,59 "),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerAlcool,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: "Preço Gazolina, ex: 3,59 "),
                    style: TextStyle(fontSize: 22),
                    controller: _controllerGazolina),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      _calcular();
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.all(20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(_textoResultado,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ),
          )),
    );
  }
}
