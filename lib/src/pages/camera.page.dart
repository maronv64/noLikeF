import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  PickedFile imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camara'),
        actions: imageFile == null
            ? null
            : <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _decideImageView(context),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.save,
      //     color: Colors.purple,
      //   ),
      //   onPressed: () {
      //     print("camara");
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => CameraPage()),
      //     );
      //   },
      // ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Galeria", textAlign: TextAlign.center),
                    onTap: () {
                      print('galeria');
                      _openGallary(context);
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    child: Text("Cámara", textAlign: TextAlign.center),
                    onTap: () {
                      print("camara");
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _openGallary(BuildContext context) async {
    var picture =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });

    Navigator.pop(context);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => CameraPage())
    // );
  }

  _openCamera(BuildContext context) async {
    var picture =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    imageFile = picture;
    Navigator.pop(context);
  }

  Widget _decideImageView(BuildContext context) {
    if (imageFile == null) {
      return Column(
        children: [
          Text(
            'No se ha seleccionado ninguna Imagen',
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text("Selecciona una Imagen"),
            onPressed: () {
              _showChoiceDialog(context);
            },
          )
        ],
      );
    } else {
      return Expanded(
        child: Image.file(File(imageFile.path),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill),
      );
    }
  }
}
