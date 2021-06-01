import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  String valor;

  Resultado(this.valor);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    var _imagemAleatorio;
    if (widget.valor == 'cara') {
      _imagemAleatorio = "images/moeda_cara.png";
    } else {
      _imagemAleatorio = "images/moeda_coroa.png";
    }

    return Scaffold(
      body: Container(
        color: Color(0xff61bd86),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(_imagemAleatorio),
            Padding(
              padding: EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('images/botao_voltar.png'),
              ),
            )
          ],
        )),
      ),
    );
  }
}
