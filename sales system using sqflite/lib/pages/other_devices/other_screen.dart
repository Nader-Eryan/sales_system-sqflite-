import 'package:dashboard/pages/Screens/transaction.dart';
import 'package:flutter/material.dart';

import '../../../Database/sql_database.dart';

class OtherCat extends StatefulWidget {
  const OtherCat({super.key});

  @override
  State<OtherCat> createState() => _OtherCatState();
}

class _OtherCatState extends State<OtherCat> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List otherDevices = [];

  Future readData() async {
    List<Map> response = await sqlDb.readData(
        "SELECT * FROM 'products' WHERE cat != 'headphone' AND cat != 'laptop' AND cat != 'phone' AND cat != 'pc' AND cat != 'tablet'");
    otherDevices.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    otherDevices = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("OtherCat"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: otherDevices.length,
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
                            builder: (__) => Transaction(
                                productModel: otherDevices[index])));
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 139, 187, 226),
                    textColor: Colors.indigo,
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.devices_other),
                    title: Text('${otherDevices[index]['name']}'),
                    subtitle: Text(
                        'price: ${otherDevices[index]['price']}   amount:${otherDevices[index]['initialAmount']}'),
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
                                'DELETE FROM products WHERE id = ${otherDevices[index]['id']}');
                            if (response > 0) {
                              int response =
                                  await sqlDb.insert("finishedProducts", {
                                "name": otherDevices[index]['name']!,
                                "cat": otherDevices[index]['cat']!,
                                "price": otherDevices[index]['price']!,
                              });
                            }
                            if (response > 0) {
                              otherDevices.removeWhere((element) =>
                                  element['id'] == otherDevices[index]['id']);
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
