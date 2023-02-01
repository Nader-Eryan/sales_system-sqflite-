import 'package:dashboard/pages/Screens/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: 190,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 166,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // color: Colors.lightGreen[300],
              color: Colors.grey[700],
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 10), color: Colors.black, blurRadius: 20)
              ]),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) =>  Transaction(productModel: null,)));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 160,
              width: 200,
              child: Image.asset(
                'images/images.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 135,
              width: size.width - 200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Text(
                          "Iphone",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.yellow[600],
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(child: Text("Price: 20000\$")),
                        ),
                      )
                    ]),
              ),
            ))
      ]),
    );
  }
}
