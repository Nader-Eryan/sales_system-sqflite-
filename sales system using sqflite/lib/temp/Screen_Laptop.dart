import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/Helper_Home_Page.dart';

class LaptopScreen extends StatefulWidget {
  @override
  _PCScreenState createState() => _PCScreenState();
}

class _PCScreenState extends State<LaptopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Laptop")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Help(
              title: "DELL",
              icon: Icons.laptop_mac,
              color: Colors.blue,
              background: Colors.lime,
              routes: "Dell",
            ),
            Help(
              title: "APPLE",
              icon: Icons.laptop_mac,
              color: Colors.yellow,
              background: Colors.pink,
              routes: "Apple",
            ),
            Help(
              title: "ASER",
              icon: Icons.laptop_mac,
              color: Colors.green,
              background: Colors.purple,
              routes: "Aser",
            ),
            Help(
              title: "HP",
              icon: Icons.laptop_mac,
              color: Colors.pink,
              background: Colors.blue,
              routes: "HP",
            ),
            Help(
              title: "LENOVO",
              icon: Icons.laptop_mac,
              color: Colors.purple,
              background: Colors.purple,
              routes: "Lenovo",
            ),
            Help(
              title: "SAMSUNG",
              icon: Icons.laptop_mac,
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
