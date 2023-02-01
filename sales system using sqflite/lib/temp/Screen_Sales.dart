import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/Helper_Home_Page.dart';

class SalesScreen extends StatefulWidget {
  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("all products")),
      body: Stack(children: [
        Container(
          // margin: EdgeInsets.only(top: 250),
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Help(
                  title: "Best Seller",
                  icon: Icons.thumb_up,
                  color: Colors.blue,
                  background: Colors.lime,
                  routes: "BestSeller"),
              Help(
                  title: "Least Selling",
                  icon: Icons.thumb_down,
                  color: Colors.red,
                  background: Colors.blueGrey,
                  routes: "Least Selling"),
            ],
          ),
        ),
      ]),
    );
  }
}
