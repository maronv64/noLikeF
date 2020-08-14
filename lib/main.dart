import 'package:flutter/material.dart';
import './src/pages/inicio.page.dart';
import './src/pages/login.page.dart';
import './src/pages/register.page.dart';
import './src/pages/anonimo.page.dart';
// import './src/pages/home.page.dart';
import './src/components/tabs.components.dart';

void main() {
  runApp(MyApp());
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
        '/tabs': (context) => TabMenu(),
        // '/gallery': (context) => _GridDemoPhotoItem(),
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}