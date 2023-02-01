import 'package:dashboard/Helper/Helper_page..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/Helper_page..dart';

class Best_Seller_Screen extends StatefulWidget {
  @override
  _Best_Seller_ScreenState createState() => _Best_Seller_ScreenState();
}

class _Best_Seller_ScreenState extends State<Best_Seller_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Best Seller"),
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
