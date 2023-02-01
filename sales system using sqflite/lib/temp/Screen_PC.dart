import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/Helper_Home_Page.dart';

class PCScreen extends StatefulWidget {
  @override
  _PCScreenState createState() => _PCScreenState();
}

class _PCScreenState extends State<PCScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("PC")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Help(
              title: "DELL",
              icon: Icons.computer_outlined,
              color: Colors.blue,
              background: Colors.lime,
              routes: "Dell",
            ),
            Help(
              title: "APPLE",
              icon: Icons.computer_outlined,
              color: Colors.yellow,
              background: Colors.pink,
              routes: "Apple",
            ),
            Help(
              title: "ASER",
              icon: Icons.computer_outlined,
              color: Colors.green,
              background: Colors.purple,
              routes: "Aser",
            ),
            Help(
              title: "HP",
              icon: Icons.computer_outlined,
              color: Colors.pink,
              background: Colors.blue,
              routes: "HP",
            ),
            Help(
              title: "LENOVO",
              icon: Icons.computer_outlined,
              color: Colors.purple,
              background: Colors.purple,
              routes: "Lenovo",
            ),
            Help(
              title: "SAMSUNG",
              icon: Icons.computer_outlined,
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
