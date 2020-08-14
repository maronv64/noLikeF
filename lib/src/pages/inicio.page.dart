import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inicio'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.purpleAccent,
                      child: Text(
                        'Ingresar con una cuenta',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, '/login');
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    color: Colors.transparent,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.purpleAccent,
                      child: Text(
                        'Entrar anonimamente',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, '/anonimo');
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
