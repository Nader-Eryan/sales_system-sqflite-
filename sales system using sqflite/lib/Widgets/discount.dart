import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Discount extends StatelessWidget {
  final double priceBefore;
  final double priceAfter;
  const Discount(
      {required this.priceBefore, required this.priceAfter, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int discountPercent = (100 - (priceAfter / priceBefore * 100)).round();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Price: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          '$priceBefore ',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        Text(
          '$priceAfter ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          '-$discountPercent% OFF',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
