import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;
  const CustomButton({
    this.text = 'Place Holder',
    this.color = Colors.blue,
    this.onTap,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: TextButton.styleFrom(backgroundColor: color),
      child: Text(text),
    );
  }
}
