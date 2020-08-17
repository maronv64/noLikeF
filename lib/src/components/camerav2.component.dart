import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'camerascreen/camera_screen.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraComponent extends StatefulWidget {
  @override
  _CameraComponentState createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  CameraController _cameraController;
  List _cameras;
  int _selectedCameraIndex;
  String _imagePath;

  void initState() {
    super.initState();

    availableCameras().then((_availableCameras) {
      _cameras = _availableCameras;
      if (_cameras.length > 0) {
        setState(() {
          _selectedCameraIndex = 0;
        });

        _initCameraController(_cameras[_selectedCameraIndex]).then((void v) {});
      } else {
        print("No existen camaras");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  Future _initCameraController(CameraDescription _cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController.dispose();
    }

    _cameraController =
        CameraController(_cameraDescription, ResolutionPreset.high);
    _cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (_cameraController.value.hasError) {
        print('Camera error ${_cameraController.value.errorDescription}');
      }
    });

    try {
      await _cameraController.initialize();
    } on CameraException catch (e) {
      //_showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: _cameraController.value.aspectRatio,
      child: CameraPreview(_cameraController),
    );
  }

  Widget build(BuildContext context) {
    return _cameraPreviewWidget();
  }
}
