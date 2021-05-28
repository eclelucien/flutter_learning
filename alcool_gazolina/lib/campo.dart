import 'package:flutter/material.dart';

class CampoDeTexto extends StatelessWidget {
  const CampoDeTexto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Preço Alcool, ex: 1,59 "),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Preço Alcool, ex: 1,59 "),
          )
        ],
      ),
    );
  }
}
