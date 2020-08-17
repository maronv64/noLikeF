import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import './src/components/camera_zero.component.dart';
import './src/components/camera_ultra.component.dart';

import './src/pages/inicio.page.dart';
import './src/pages/login.page.dart';
import './src/pages/register.page.dart';
import './src/pages/anonimo.page.dart';
import './src/pages/home.page.dart';
import 'src/components/tabs.component.dart';

// void main() {
//   runApp(MyApp());
// }

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InicioPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/anonimo': (context) => AnonimoPage(),
        '/tabs': (context) => TabMenu(cameras: cameras),
        '/home': (context) => HomePage(cameras: cameras),
        // '/camera': (context) => CameraPage(),
        '/camera2': (context) => CameraScreen(cameras),
        '/camera3': (context) => TakePictureScreen(cameras: cameras),
        // '/gallery': (context) => _GridDemoPhotoItem(),
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   // Obtain a list of the available cameras on the device.

//   runApp(
//     MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => InicioPage(),
//         '/login': (context) => LoginPage(),
//         '/register': (context) => RegisterPage(),
//         '/anonimo': (context) => AnonimoPage(),
//         '/tabs': (context) => TabMenu(),
//         '/home': (context) => HomePage(),
//         '/camera': (context) => CameraPage(),
//         '/camera2': (context) => TakePictureScreen(),
//       },
//     ),
//   );
// }
