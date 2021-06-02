import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "resultado";

  _recuperaCep() async {
    String cepDigitado = _controllerCep.text;
    var url = "http://viacep.com.br/ws/${cepDigitado}/json/";

    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "${logradouro}, ${complemento}, ${localidade}";
    });

    //print("rseposta" + response.body);
    // print("repsosta" + response.statusCode.toString());

    print(
        " Resposta logradouro: ${logradouro},\n complemento: ${complemento},\n localidade: ${localidade}, \n Bairro: ${bairro}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consumo de Serviço",
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "DIgite o cep: ex: 89809456"),
              style: TextStyle(fontSize: 20),
              controller: _controllerCep,
            ),
            TextButton(
              onPressed: _recuperaCep,
              child: Text(
                "Clique aqui",
                style: TextStyle(
                    backgroundColor: Colors.green,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
