import 'package:dashboard/Helper/Helper_page..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/Helper_page..dart';

class Least_Selling_Screen extends StatefulWidget {
  @override
  _Least_Selling_ScreenState createState() => _Least_Selling_ScreenState();
}

class _Least_Selling_ScreenState extends State<Least_Selling_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Least Selling"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return Column(children: [
              Helper(
                title: "IPHONE",
                price: 20000,
              ),
              Helper(
                title: "OPPO",
                price: 6000,
              ),
            ]);
          }),
    );
  }
}
