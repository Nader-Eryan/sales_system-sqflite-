import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/Helper_Home_Page.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Category")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Help(
              title: "Phones",
              icon: Icons.phone_android,
              color: Colors.blue,
              background: Colors.lime,
              routes: "Phones",
            ),
            Help(
              title: "Laptop",
              icon: Icons.laptop_mac,
              color: Colors.yellow,
              background: Colors.pink,
              routes: "Laptop",
            ),
            Help(
              title: "PC",
              icon: Icons.computer_sharp,
              color: Colors.green,
              background: Colors.purple,
              routes: "PC",
            ),
            Help(
              title: "Tablet",
              icon: Icons.tablet,
              color: Colors.pink,
              background: Colors.blue,
              routes: "Tablet",
            ),
            Help(
              title: "HeadPhone",
              icon: Icons.headphones,
              color: Colors.grey,
              background: Colors.yellow,
              routes: "HeadPhone",
            ),
            Help(
              title: "Other",
              icon: Icons.devices_other_outlined,
              color: Colors.red,
              background: Colors.blueGrey,
              routes: "OtherCat",
            ),
          ],
        ),
      ),
    );
  }
}
