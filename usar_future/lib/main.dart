import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: "Trabalhar com future",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<Map> _recuperarPreco() async {
  String url = "https://blockchain.info/ticker";
  http.Response response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarPreco()
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print("connexao none");
            break;
          case ConnectionState.waiting:
            print("connexao waiting");
            break;
          case ConnectionState.active:
            print("connexao ative");
            break;
          case ConnectionState.done:
            print("connexao done");
            break;
          default:
        }
      },
    );
  }
}
