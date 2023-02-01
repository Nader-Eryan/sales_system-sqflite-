import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;
  const CustomIconButton({
    this.text = 'Place Holder',
    this.color = Colors.blue,
    this.icon = Icons.error,
    this.onTap,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: TextButton.styleFrom(backgroundColor: color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
