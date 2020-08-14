import 'package:flutter/material.dart';
import '../environment/environment.dart';
// import '../components/tabs.components.dart';
// import 'package:noLike/src/services/prueba.service.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './gallery.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  Map data;
  List lista = [];
  List listaPokemons = [];
  // Map metaDataPoke;

  getPokemons() async {
    http.Response response = await http.get('$server');
    data = json.decode(response.body);
    setState(() {
      lista = data['results'];
    });

    for (var item in data['results']) {
      http.Response response_metadata = await http.get('${item['url']}');
      Map metaDataPoke = json.decode(response_metadata.body);

      var newItem = {'item': item, 'metadata': metaDataPoke};
      setState(() {
        listaPokemons.add(newItem);
      });
    }

    debugPrint(listaPokemons.toList().toString());
  }

  List<Widget> construirLista() {
    // List<Widget> lisss;
    return lista
        .map(
          (e) => InkWell(
            onTap: () {
              print('hol');
            },
            child: Center(
              child: Text('hola'),
            ),
          ),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();

    getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        // automaticallyImplyLeading: false,
      ),
      body: GridListDemo(),
    );
    // return GridListDemo();
  }
}
