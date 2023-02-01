import 'package:dashboard/Helper/Helper_product.dart';
import 'package:dashboard/modules/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Database/sql_database.dart';
import '../Screens/transaction.dart';

class HeadPhones extends StatefulWidget {
  const HeadPhones({super.key});

  @override
  State<HeadPhones> createState() => _HeadPhonesState();
}

class _HeadPhonesState extends State<HeadPhones> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List headPhones = [];

  Future readData() async {
    List<Map> response = await sqlDb
        .readData("SELECT * FROM 'products' WHERE cat = 'headphone'");
    headPhones.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    headPhones = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("HeadPhones"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: headPhones.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (__) =>
                                Transaction(productModel: headPhones[index])));
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 139, 187, 226),
                    textColor: Colors.indigo,
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.headphones),
                    title: Text('${headPhones[index]['name']}'),
                    subtitle: Text(
                        'price: ${headPhones[index]['price']}   amount:${headPhones[index]['initialAmount']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              int response = await sqlDb.deleteData(
                                  'DELETE FROM products WHERE id = ${headPhones[index]['id']}');
                              if (response > 0) {
                                int response =
                                    await sqlDb.insert("finishedProducts", {
                                  "name": headPhones[index]['name']!,
                                  "cat": headPhones[index]['cat']!,
                                  "price": headPhones[index]['price']!,
                                });
                              }
                              if (response > 0) {
                                Navigator.of(context)
                                    .pushReplacementNamed('homePage');
                              } else {
                                print('product insertion error!');
                              }
                              headPhones.removeWhere((element) =>
                                  element['id'] == headPhones[index]['id']);
                              setState(() {});
                            }),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
