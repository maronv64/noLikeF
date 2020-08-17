import 'package:flutter/material.dart';
import '../pages/home.page.dart';

class TabMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color(0xFF3F5AA6),
          //   title: Text("Title text"),
          // ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              HomePage(),
              Container(child: Icon(Icons.directions_transit)),
              // Container(child: TakePictureScreen()),
              Container(child: Icon(Icons.directions_bike)),
              Container(child: Icon(Icons.directions_bike)),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.purple, //Color(0xFF3F5AA6)
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Buscar",
            icon: Icon(Icons.search),
          ),
          // Tab(
          //   // text: "add",
          //   icon: Icon(Icons.add),
          //   // child: FloatingActionButton(
          //   //   backgroundColor: Colors.white,
          //   //   onPressed: null,
          //   //   child: Icon(
          //   //     Icons.add,
          //   //     color: Colors.purple,
          //   //   ),
          //   // ),
          // ),
          Tab(
            text: "Perfil",
            icon: Icon(Icons.person),
          ),
          Tab(
            text: "Ajustes",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
