import 'package:alcool_gazolina/campo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou gazolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
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
            CampoDeTexto(),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Calcular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
