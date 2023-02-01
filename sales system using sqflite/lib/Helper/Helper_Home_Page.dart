import 'package:flutter/material.dart';
import '../pages/Screens/Screen_Category.dart';

class Help extends StatelessWidget {
  Help({
    this.title,
    this.icon,
    this.color,
    this.background,
    this.routes,
  });
  final String? title, routes;
  final IconData? icon;
  final MaterialColor? color, background;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 21, 21, 21),
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routes!);
        },
        splashColor: color,
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            icon,
            size: 70,
            color: color,
          ),
          Text(
            title!,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          )
        ])),
      ),
    );
  }
}
