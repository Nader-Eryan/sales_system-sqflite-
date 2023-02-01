import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String name;

  final String category;
  const ItemDetails({
    Key? key,
    required this.name,
    this.category = 'No Details Available.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'Details:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ItemDetail(
          itemDetail: 'Name:',
          itemDescription: name,
        ),
        ItemDetail(
          itemDetail: 'Category:',
          itemDescription: category,
        ),
      ],
    );
  }
}

class ItemDetail extends StatelessWidget {
  final String itemDetail;
  final String itemDescription;
  const ItemDetail({
    required this.itemDetail,
    required this.itemDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(itemDetail),
            Text(itemDescription),
          ],
        ),
      ),
    );
  }
}
