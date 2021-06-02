import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clentes"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset('images/detalhe_cliente.png'),
                    Text(
                      'Nossos clientes',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices lobortis mi eu gravida. Fusce ornare dictum diam id vulputate. Sed tempus lorem id lorem tempus ultricies. Nullam leo risus, tempor et neque eu, maximus pulvinar justo. Aenean et dictum sem. Duis et augue et erat tincidunt mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}
