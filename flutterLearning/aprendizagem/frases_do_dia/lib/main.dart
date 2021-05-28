import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Frases do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var _frasesGeradas = [
    "Uma primeira frase gerada",
    "Uma segunda frase gerada",
    "Uma terceira frase gerada",
    "Uma quarta frase gerada",
  ];

  var _fraseGerada = "Aperte abaixo para gerar uma nova frase!";

  void _incrementSentences() {
    setState(() {
      var numeroSorteado = Random().nextInt(_frasesGeradas.length);
      _fraseGerada = _frasesGeradas[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logo.png'),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
              ),
              TextButton(
                onPressed: () {
                  _incrementSentences();
                },
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.green, backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
