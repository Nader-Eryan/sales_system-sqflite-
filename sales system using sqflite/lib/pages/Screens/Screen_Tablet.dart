import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/Helper_Home_Page.dart';

class TabletScreen extends StatefulWidget {
  @override
  _PCScreenState createState() => _PCScreenState();
}

class _PCScreenState extends State<TabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Tablet")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Help(
              title: "DELL",
              icon: Icons.tablet_android_rounded,
              color: Colors.blue,
              background: Colors.lime,
              routes: "Dell",
            ),
            Help(
              title: "APPLE",
              icon: Icons.tablet_android_rounded,
              color: Colors.yellow,
              background: Colors.pink,
              routes: "Apple",
            ),
            Help(
              title: "ASER",
              icon: Icons.tablet_android_rounded,
              color: Colors.green,
              background: Colors.purple,
              routes: "Aser",
            ),
            Help(
              title: "HP",
              icon: Icons.tablet_android_rounded,
              color: Colors.pink,
              background: Colors.blue,
              routes: "HP",
            ),
            Help(
              title: "LENOVO",
              icon:  Icons.tablet_android_rounded,
              color: Colors.purple,
              background: Colors.purple,
              routes: "Lenovo",
            ),
            Help(
              title: "SAMSUNG",
              icon: Icons.tablet_android_rounded,
              color: Colors.grey,
              background: Colors.blue,
              routes: "Samsung",
            ),
          ],
        ),
      ),
    );
  }
}
