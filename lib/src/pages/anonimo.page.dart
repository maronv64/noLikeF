import 'package:flutter/material.dart';

class AnonimoPage extends StatefulWidget {
  @override
  _AnonimoPageState createState() => _AnonimoPageState();
}

class _AnonimoPageState extends State<AnonimoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController inputUsuarioController = new TextEditingController();
  String inputUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicia Sesión'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'http://wallpoper.com/images/00/42/70/35/apple-inc_00427035.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: inputUsuarioController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: 'Ingrese un nombre',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Ingrese algun texto';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 7),
                      Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: RaisedButton(
                          // shape: new RoundedRectangleBorder(
                          //   borderRadius: new BorderRadius.circular(30),
                          // ),
                          color: Colors.purpleAccent,
                          child: Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            setState(() {
                              inputUsuario =
                                  inputUsuarioController.text.toString();

                              Navigator.pushNamed(context, '/tabs');
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
