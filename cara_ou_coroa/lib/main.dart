import 'dart:math';

import 'package:cara_ou_coroa/Resultado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Cara ou Coroa",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _exibirresultado() {
    var valores = ["cara", "coroa"];
    var result = Random().nextInt(valores.length);
    var lastresult = valores[result];

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Resultado(lastresult)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff61bd86),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/logo.png'),
            Padding(
              padding: EdgeInsets.all(16),
              child: GestureDetector(
                onTap: _exibirresultado,
                child: Image.asset('images/botao_jogar.png'),
              ),
            )
          ],
        )),
      ),
    );
  }
}
