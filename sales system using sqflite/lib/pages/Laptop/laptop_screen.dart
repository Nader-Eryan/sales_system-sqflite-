import 'package:flutter/material.dart';

import '../../Database/sql_database.dart';
import '../Screens/transaction.dart';

class LaptopsScreen extends StatefulWidget {
  const LaptopsScreen({super.key});

  @override
  State<LaptopsScreen> createState() => _LaptopsScreenState();
}

class _LaptopsScreenState extends State<LaptopsScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List laptop = [];

  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM 'products' WHERE cat = 'laptop'");
    laptop.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    laptop = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Laptops"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: laptop.length,
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
                                Transaction(productModel: laptop[index])));
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 139, 187, 226),
                    textColor: Colors.indigo,
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.laptop_chromebook),
                    title: Text('${laptop[index]['name']}'),
                    subtitle: Text(
                        'price: ${laptop[index]['price']}   amount:${laptop[index]['initialAmount']}'),
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
                                'DELETE FROM products WHERE id = ${laptop[index]['id']}');
                            if (response > 0) {
                              int response =
                                  await sqlDb.insert("finishedProducts", {
                                "name": laptop[index]['name']!,
                                "cat": laptop[index]['cat']!,
                                "price": laptop[index]['price']!,
                              });
                            }
                            if (response > 0) {
                              laptop.removeWhere((element) =>
                                  element['id'] == laptop[index]['id']);
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
