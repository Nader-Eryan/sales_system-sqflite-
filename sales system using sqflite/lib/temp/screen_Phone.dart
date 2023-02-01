import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/Helper_Home_Page.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Phone")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Help(
              title: "IPHONE",
              icon: Icons.phone_android,
              color: Colors.blue,
              background: Colors.lime,
              routes: "iphone",
            ),
            Help(
              title: "OPPO",
              icon: Icons.phone_android,
              color: Colors.yellow,
              background: Colors.pink,
              routes: "oppo",
            ),
            Help(
              title: "SAMSUNG",
              icon: Icons.phone_android,
              color: Colors.green,
              background: Colors.purple,
              routes: "samsung",
            ),
            Help(
              title: "HUAWEI",
              icon: Icons.phone_android,
              color: Colors.pink,
              background: Colors.blue,
              routes: "huawei",
            ),
          ],
        ),
      ),
    );
  }
}
