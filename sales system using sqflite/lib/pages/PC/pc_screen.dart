import 'package:flutter/material.dart';

import '../../Database/sql_database.dart';
import '../Screens/transaction.dart';

class PcScreen extends StatefulWidget {
  const PcScreen({super.key});

  @override
  State<PcScreen> createState() => _PcScreenState();
}

class _PcScreenState extends State<PcScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List PCs = [];

  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM 'products' WHERE cat = 'pc'");
    PCs.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    PCs = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("PC"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: PCs.length,
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
                                Transaction(productModel: PCs[index])));
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 139, 187, 226),
                    textColor: Colors.indigo,
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.computer_outlined),
                    title: Text('${PCs[index]['name']}'),
                    subtitle: Text(
                        'price: ${PCs[index]['price']}   amount:${PCs[index]['initialAmount']}'),
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
                                'DELETE FROM products WHERE id = ${PCs[index]['id']}');
                            if (response > 0) {
                              int response =
                                  await sqlDb.insert("finishedProducts", {
                                "name": PCs[index]['name']!,
                                "cat": PCs[index]['cat']!,
                                "price": PCs[index]['price']!,
                              });
                            }
                            if (response > 0) {
                              PCs.removeWhere((element) =>
                                  element['id'] == PCs[index]['id']);
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
