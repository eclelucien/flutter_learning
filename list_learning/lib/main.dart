import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List Learning",
      home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _itens = [];

  void _carregarItens() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} outras coisas";
      item["descricao"] = "Descricao ${i} outras coisas";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Parendizagem"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              // Map<String, dynamic> =
              print("item ${_itens[indice].toString()}");

              return ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Titulo"),
                        content: Text("Conteudo"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              print("sim");
                              Navigator.pop(context);
                            },
                            child: Text("Oui"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("nao");
                              Navigator.pop(context);
                            },
                            child: Text("nao"),
                          )
                        ],
                      );
                    },
                  );
                },
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }),
      ),
    );
  }
}
