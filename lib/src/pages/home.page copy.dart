import 'package:flutter/material.dart';
import '../environment/environment.dart';
// import '../components/tabs.components.dart';
// import 'package:noLike/src/services/prueba.service.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// import 'package:flutter/flutter_downloader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Widget hola() {
  return Text('code');
  // UserAgentClient(userAgent, _inner)
  //     .fetchAlbum()
  //     .then((value) => null)
  //     .catchError(onError);
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
    // debugPrint(response.body);
    setState(() {
      lista = data['results'];
    });

    // http.Response response_metadata = await http.get('$server');
    // Map metaDataPoke = json.decode(response_metadata.body);

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
    // debugPrint(lista.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: listaPokemons == null ? 0 : listaPokemons.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //       image: NetworkImage(
              //           'https://i.ytimg.com/vi/p8lWGB5aDnE/maxresdefault.jpg'),
              //       fit: BoxFit.fill),
              // ),
              height: MediaQuery.of(context).size.height * 0.80,
              child: Card(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.ytimg.com/vi/p8lWGB5aDnE/maxresdefault.jpg'),
                          fit: BoxFit.fill),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: NetworkImage(
                                  '${listaPokemons[index]['metadata']['sprites']['front_default']}'),
                            ),
                            Text('${listaPokemons[index]['item']['name']}'),
                          ],
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              onPressed: null,
                              child: Icon(Icons.file_download),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            // return InkWell(
            //   onTap: () {
            //     print('hola :' + index.toString());
            //   },
            //   child: Card(
            //     child: Row(
            //       children: <Widget>[Text('${lista[index]['name']}')],
            //     ),
            //   ),
            // );
          }),
    );
  }
}

// List.generate(100, (index) {
//             return Center(
//               child: Text(
//                 'Item $index',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//             );
//           })

// ListView(
//   padding: const EdgeInsets.all(8),
//   children: <Widget>[
//     Container(
//       height: 50,
//       color: Colors.amber[600],
//       child: const Center(child: Text('Entry A')),
//     ),
//     Container(
//       height: 50,
//       color: Colors.amber[500],
//       child: const Center(child: Text('Entry B')),
//     ),
//     Container(
//       height: 50,
//       color: Colors.amber[100],
//       child: const Center(child: Text('Entry C')),
//     ),
//   ],
// )
