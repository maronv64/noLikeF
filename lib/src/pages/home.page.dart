import 'package:flutter/material.dart';
import 'package:noLike/src/components/camera_zero.component.dart';
import 'package:noLike/src/components/camera_ultra.component.dart';

import '../environment/environment.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../components/gallery.component.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  HomePage({@required this.cameras});
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Navigator.pushNamed(context, 'home-add-modal');
          print("camara");
          // return CameraScreen(widget.cameras);
          // Navigator.of(context).pushNamed('/login');
          Navigator.push(
            context,
            //  MaterialPageRoute(builder: (context) => CameraPage()),
            // MaterialPageRoute(builder: (context) => TakePictureScreen()),
            MaterialPageRoute(
                builder: (context) =>
                    TakePictureScreen(cameras: widget.cameras)),
          );
          // Navigator.pop(context);
          // CameraComponent();
          // TakePictureScreen();
        },
        child: Icon(
          Icons.add,
          color: Colors.purple,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    // return GridListDemo();
  }
}
