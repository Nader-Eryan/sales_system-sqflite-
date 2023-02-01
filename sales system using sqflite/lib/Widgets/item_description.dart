import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  final String description;
  const ItemDescription(
      {this.description = 'No Description Available.', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Description:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints:
                BoxConstraints(minHeight: 50, minWidth: double.infinity),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
