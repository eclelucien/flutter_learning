// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerTarefa = TextEditingController();

  Map<String, dynamic> _ultimaTarefaRemovida = Map();
  List _lista = [];

  Future<File> _getFile() async {
    final diretorio =
        await getApplicationDocumentsDirectory(); //aqui recebemos a pasta onde nos vamos guadar o nossos dados
    return File(
        "${diretorio.path}/dadoslista.json"); //aqui criamos uma pasta dentro daquela pasta e deixamos o nosso arquivo la
  }

  _salvarTarefa() async {
    String TextoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = TextoDigitado;
    tarefa["realizada"] = false;
    setState(() {
      _lista.add(tarefa);
      _controllerTarefa.text = "";
    });
    _salvarArquivo();
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    //criar dados

    String dados = json.encode(
        _lista); //aqui trnsformamos os dados da nossa lista em json e guardamos os resultados numa string
    arquivo.writeAsString(
        dados); //aqui pegamos a string que contem as nossos dados em json e colocamos tudo no nosso arquivo
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();

      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _lista = json.decode(dados);
      }); //aqu a minha recebe os dados no formato json
    });
  }

  Widget criarItemLista(context, index) {
    final item = _lista[index]["titulo"];
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _ultimaTarefaRemovida = _lista[index];

        _lista.removeAt(index);

        final snackbar = SnackBar(
          content: Text("Tarefa removido com sucesso"),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                _lista.insert(index, _ultimaTarefaRemovida);
              });

              _salvarArquivo();
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: CheckboxListTile(
          value: _lista[index]['realizada'],
          title: Text(_lista[index]["titulo"]),
          onChanged: (valorAlterado) {
            setState(() {
              _lista[index]['realizada'] = valorAlterado;
            });
            _salvarArquivo();
          }),
      background: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lista de tarefas",
            style: TextStyle(),
          ),
          backgroundColor: Colors.purple,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Adicionar tarefa"),
                    content: TextField(
                      controller: _controllerTarefa,
                      decoration:
                          InputDecoration(labelText: "Digite a sua tarefa"),
                      // onChanged: ,
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            _salvarTarefa();
                            Navigator.pop(context);
                          },
                          child: Text("Add")),
                      ElevatedButton(
                          onPressed: () {
                            //Temos que salvar antes de fechar
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"))
                    ],
                  );
                });
          },
          backgroundColor: Colors.purple,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: _lista.length, itemBuilder: criarItemLista))
          ],
        ));
  }
}
