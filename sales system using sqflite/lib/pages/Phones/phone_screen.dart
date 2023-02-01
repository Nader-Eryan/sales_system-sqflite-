import 'package:dashboard/Helper/Helper_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Database/sql_database.dart';
import '../Screens/transaction.dart';

class PhonesScreen extends StatefulWidget {
  const PhonesScreen({super.key});

  @override
  State<PhonesScreen> createState() => _PhonesScreenState();
}

class _PhonesScreenState extends State<PhonesScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List phones = [];

  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM 'products' WHERE cat = 'phone'");
    phones.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    phones = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Phones"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: phones.length,
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
                                Transaction(productModel: phones[index])));
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
                    title: Text('${phones[index]['name']}'),
                    subtitle: Text(
                        'price: ${phones[index]['price']}   amount:${phones[index]['initialAmount']}'),
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
                                'DELETE FROM products WHERE id = ${phones[index]['id']}');
                            if (response > 0) {
                              int response =
                                  await sqlDb.insert("finishedProducts", {
                                "name": phones[index]['name']!,
                                "cat": phones[index]['cat']!,
                                "price": phones[index]['price']!,
                              });
                            }
                            if (response > 0) {
                              phones.removeWhere((element) =>
                                  element['id'] == phones[index]['id']);
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
