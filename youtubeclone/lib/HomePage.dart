import 'package:flutter/material.dart';
import 'package:youtubeclone/telas/Inicio.dart';
import 'package:youtubeclone/telas/Biblioteca.dart';
import 'package:youtubeclone/telas/Inscricao.dart';
import 'package:youtubeclone/telas/EmAlta.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> listas = [Inicio(), EmAlta(), Biblioteca(), Inscricao()];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[600], opacity: 0.5),
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print("acao: videocam");
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("acao: pesquisa");
              }),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("acao: conta");
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: listas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red[600],
        items: [
          BottomNavigationBarItem(
              label: "Inicio",
              icon: Icon(Icons.home),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              label: "Em alta",
              icon: Icon(Icons.whatshot),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              label: "Inscrições",
              icon: Icon(Icons.subscriptions),
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              label: "Biblioteca",
              icon: Icon(Icons.folder),
              backgroundColor: Colors.red)
          // BottomNavigationBarItem(label: "Em alta", icon: Icon(Icons.whatshot)),
        ],
      ),
    );
  }
}
