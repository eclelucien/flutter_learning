import 'dart:math';

import 'package:flutter/material.dart';

class JogoJokenpo extends StatefulWidget {
  @override
  _JogoJokenpoState createState() => _JogoJokenpoState();
}

class _JogoJokenpoState extends State<JogoJokenpo> {
  String _mensagem = "Escolha uma opção em baixo";
  var _imagePadrao = Image.asset(
    'images/padrao.png',
  );

  _imagesChange(String image) {
    var options = ["papel", "pedra", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaDoApp = options[numero];

    switch (escolhaDoApp) {
      case 'pedra':
        setState(() {
          _imagePadrao = Image.asset('images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          _imagePadrao = Image.asset('images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          _imagePadrao = Image.asset('images/tesoura.png');
        });
        break;
      default:
        setState(() {
          _imagePadrao = Image.asset('images/padrao.png');
        });
        break;
    }

    //Condiçaõ para quem gagna e qem perde
    //Usuario gagnar

    if ((image == 'tesoura' && escolhaDoApp == 'papel') ||
        (image == 'papel' && escolhaDoApp == 'pedra') ||
        (image == 'pedra' && escolhaDoApp == 'tesoura')) {
      setState(() {
        this._mensagem = "Você gagnou!";
      });
    } else if ((escolhaDoApp == 'tesoura' && image == 'papel') ||
        (escolhaDoApp == 'papel' && image == 'pedra') ||
        (escolhaDoApp == 'pedra' && image == 'tesoura')) {
      this._mensagem = "Você perdeu!";
    } else if (escolhaDoApp == image) {
      this._mensagem = "Empatamos!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jokenpo",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Escolha do App",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            _imagePadrao,
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(_mensagem,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _imagesChange("pedra"),
                    child: Image.asset(
                      'images/pedra.png',
                      height: 95,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _imagesChange("tesoura"),
                    child: Image.asset(
                      'images/tesoura.png',
                      height: 95,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _imagesChange("papel"),
                    child: Image.asset(
                      'images/papel.png',
                      height: 95,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
