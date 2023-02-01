// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/Database/sql_database.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/modules/product.dart';

import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_icon_button.dart';
import '../../Widgets/discount.dart';
import '../../Widgets/image_slider.dart';
import '../../Widgets/item_description.dart';
import '../../Widgets/item_details.dart';

class Transaction extends StatefulWidget {
  const Transaction({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final Map productModel;
  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final itemImages = [
    'images/mouse.jpeg',
    'images/mouse 2.jpg',
    'images/mouse 3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "${widget.productModel["name"]}",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.productModel["img"] != null)
                Image.network(
                  widget.productModel["img"],
                ),
              //!Title
              Text(
                widget.productModel["name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 40,
              ),

              //!Discount
              //Discount(priceBefore: 1500, priceAfter: 1400),
              Text(
                'Price: ${widget.productModel["price"]} LE',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 40,
              ),

              //!Item Categories
              ItemDetails(
                name: widget.productModel["name"],
                category: widget.productModel["cat"],
              ),

              const SizedBox(
                height: 40,
              ),

              //!Item Description
              ItemDescription(
                  description: widget.productModel["description"] ??
                      'No Description Available.'),

              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: 'Buy Now',
            onTap: () async {
              SqlDb sqlDb = SqlDb();
              await sqlDb.updateData('''
              UPDATE products
              SET initialAmount = ${widget.productModel["initialAmount"] - 1}
              WHERE id=${widget.productModel["id"]};
            ''');
              if (widget.productModel["initialAmount"] - 1 == 0) {
                int response = await sqlDb.deleteData(
                    'DELETE FROM products WHERE id = ${widget.productModel['id']}');
                if (response > 0) {
                  int response = await sqlDb.insert("finishedProducts", {
                    "name": widget.productModel['name']!,
                    "cat": widget.productModel['cat']!,
                    "price": widget.productModel['price']!,
                  });
                }
              }
            },
          ),
          // CustomIconButton(
          //   text: 'Add To Cart',
          //   color: Colors.orange,
          //   icon: Icons.shopping_cart,
          // ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
