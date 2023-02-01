import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helper extends StatelessWidget {
  Helper({this.title, this.price, this.routes});
  final String? title, routes;
  final int? price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(5, 5, 200, 5),
              height: 140,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Column(children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Text(
                title!,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              child: Text(
                "$price \$",
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            )
          ])
        ],
      ),
    );
  }
}
