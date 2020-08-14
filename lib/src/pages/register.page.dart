import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController inputUsuarioController = new TextEditingController();
  String inputUsuario;
  //input de la clave
  TextEditingController inputClaveController = new TextEditingController();
  String inputClave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Crear una Cuenta')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://4.bp.blogspot.com/-hp4OaC-8Bdo/U7Yz0Jo00YI/AAAAAAABBQE/uyXxHdb1oBM/s0/Clean+lines+turquoise.jpg'),
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
                          hintText: 'Ingrese el correo',
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
                      TextFormField(
                        controller: inputClaveController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                          hintText: 'Ingrese la clave',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '***';
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
                              inputClave = inputClaveController.text.toString();
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
