import 'package:dashboard/Helper/Helper_product.dart';
import 'package:flutter/material.dart';

import '../../../Database/sql_database.dart';
import '../Screens/transaction.dart';

class TabletsScreen extends StatefulWidget {
  const TabletsScreen({super.key});

  @override
  State<TabletsScreen> createState() => _TabletsScreenState();
}

class _TabletsScreenState extends State<TabletsScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List tablets = [];

  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM 'products' WHERE cat = 'tablet'");
    tablets.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    tablets = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Tablets"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: tablets.length,
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
                                Transaction(productModel: tablets[index])));
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 139, 187, 226),
                    textColor: Colors.indigo,
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.tablet_android),
                    title: Text('${tablets[index]['name']}'),
                    subtitle: Text(
                        'price: ${tablets[index]['price']}   amount:${tablets[index]['initialAmount']}'),
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
                                'DELETE FROM products WHERE id = ${tablets[index]['id']}');
                            if (response > 0) {
                              int response =
                                  await sqlDb.insert("finishedProducts", {
                                "name": tablets[index]['name']!,
                                "cat": tablets[index]['cat']!,
                                "price": tablets[index]['price']!,
                              });
                            }
                            if (response > 0) {
                              tablets.removeWhere((element) =>
                                  element['id'] == tablets[index]['id']);
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
