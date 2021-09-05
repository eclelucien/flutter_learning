import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerTitulo = TextEditingController();
  TextEditingController _controllerDescricao = TextEditingController();

  _exibirTelaCadastro() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _controllerTitulo,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Titulo", hintText: "Digite o titulo"),
                ),
                TextField(
                  controller: _controllerDescricao,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Descrição",
                      hintText: "Digite a sua descrição"),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    //Salvar os dados
                    _salvarAnotacao();
                    Navigator.pop(context);
                  },
                  child: Text("Save")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
            ],
          );
        });
  }

  _salvarAnotacao() {
    String titulo = _controllerTitulo.text;
    String descricao = _controllerDescricao.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minhas anotações"),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          color: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            _exibirTelaCadastro();
          },
          child: Icon(Icons.add),
        ));
  }
}
