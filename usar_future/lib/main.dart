// import 'dart:io';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:usar_future/Post.dart';

void main() {
  runApp(MaterialApp(
    title: "Consumo de serviço avançado",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Aqui criamos uma função para receber as informaçõa atrves do api
// Future<Map> _recuperarPreco() async {
//   String url = "https://blockchain.info/ticker";//aqui criamos um string para guardar o retorno do api
//   http.Response response = await http.get(Uri.parse(url));//aqui criamos uma variavel do tipo http para receber a resposta do no api
//   return json.decode(response.body);//aqui retornamos a resposta que rebemos do no formato json
// }

// Post post = Post(0, 0, "", "");
String _urlBase = "https://jsonplaceholder.typicode.com";

class _HomePageState extends State<HomePage> {
  //aqui estamos recuperando so dados do nosso api
  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse(_urlBase + "/posts"));
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];

    for (var post in dadosJson) {
      print("Post: " + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  //Aqui criamos um metodo para  postar novos elementos no nosso api
  _Post() async {
    var corpo = json.encode({
      "userId": 1,
      "id": null,
      "title": "Titulo",
      "body": "Corpo da postagem",
    });

    http.Response response = await http.post(
      Uri.parse(
        _urlBase + "/posts",
      ),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: corpo,
    );
    print("resposta:  ${response.statusCode}");
    print("resposta:  ${response.body}");
  }

  //Um metodo para modificar ou atualizar os dados do nosso api
  _Put() async {
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": "Titulo alterado",
      "body": "O corpo da nossa ppostagem",
    });

    http.Response response = await http.put(
      Uri.parse(
        _urlBase + "/posts/5",
      ),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: corpo,
    );
    print("resposta:  ${response.statusCode}");
    print("resposta:  ${response.body}");
  }

  //Um metodo para atualizar somente algums ddos do nosso ususario
  _Patch() async {
    var corpo = json.encode({
      "userId": 199,
      "id": 0,
      "title": "Titulo alterado no metodo patch",
      "body": "O corpo da nossa postagem tambem foi alterado nometodo patch",
    });

    http.Response response = await http.patch(
      Uri.parse(
        _urlBase + "/posts/5",
      ),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: corpo,
    );
    print("resposta:  ${response.statusCode}");
    print("resposta:  ${response.body}");
  }

  //Um ultimo metodo para apagar ou delete us dados do nosso api
  _delete() async {
    http.Response response = await http.delete(Uri.parse(
      _urlBase + "/posts/5",
    ));

    print("resposta:  ${response.statusCode}");
    print("resposta:  ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Consumo de serviço avançado"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  OutlinedButton(
                    onPressed: _Post,
                    child: Text("Salvar"),
                  ),
                  OutlinedButton(
                    onPressed: _Put,
                    child: Text("Atualizar"),
                  ),
                  OutlinedButton(
                    onPressed: _delete,
                    child: Text("Delete"),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder<List<Post>>(
                  // future: _recuperarPreco(),
                  future: _recuperarPostagens(),
                  builder: (context, snapshot) {
                    String resultado;
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                List<Post> lista = snapshot.data;
                                Post post = lista[index];
                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.id.toString()),
                                );
                              });
                        }
                        break;
                      default:
                        resultado =
                            "Sinto muito, um erro não conhecido aconteceu ao carregar as nossas informaçoes";
                        print("default");
                    }
                    return Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(resultado),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
