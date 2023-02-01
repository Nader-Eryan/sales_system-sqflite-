import 'package:dashboard/Helper/Helper_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("HP"),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        Expanded(
          child: Stack(children: [
            Container(
                margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                   color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ))),
            ListView.builder(
                itemCount: 4,
                itemBuilder: (context, i) =>Product()
                 
                ),
          ]),
        )
      ]),
    );
  }
}
