import 'package:flutter/material.dart';
import 'package:youtubeclone/Api.dart';
import 'package:youtubeclone/models/video.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listaVideos(){
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder <List<Video>>(
      future: _listaVideos(),
      builder: (context, snapshot){

        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center( 
              child: CircularProgressIndicator() 
                _);
             break;
          case ConnectionState.active:
          case ConnectionState.done:
          break; 

          default:
          return Text("nsdsa");
        }
        return Text("nsdsa");
      });
  }
}
  