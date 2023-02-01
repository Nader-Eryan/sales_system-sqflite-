import 'package:dashboard/Helper/Helper_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Database/sql_database.dart';
import '../pages/Screens/transaction.dart';

class allScreen extends StatefulWidget {
  const allScreen({super.key});

  @override
  State<allScreen> createState() => _allScreenState();
}

class _allScreenState extends State<allScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List all = [];

  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'products'");
    all.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    all = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("all"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: all.length,
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
                                Transaction(productModel: all[index])));
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 139, 187, 226),
                    textColor: Colors.indigo,
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.phone_android),
                    title: Text('${all[index]['name']}'),
                    subtitle: Text(
                        'price: ${all[index]['price']}   amount:${all[index]['initialAmount']}'),
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
                                'DELETE FROM products WHERE id = ${all[index]['id']}');
                            if (response > 0) {
                              int response =
                                  await sqlDb.insert("finishedProducts", {
                                "name": all[index]['name']!,
                                "cat": all[index]['cat']!,
                                "price": all[index]['price']!,
                              });
                            }
                            if (response > 0) {
                              all.removeWhere((element) =>
                                  element['id'] == all[index]['id']);
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
