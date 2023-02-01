import 'package:flutter/material.dart';

import '../../Database/sql_database.dart';

class Finished_proScreen extends StatefulWidget {
  const Finished_proScreen({super.key});

  @override
  State<Finished_proScreen> createState() => _Finished_proScreenState();
}

class _Finished_proScreenState extends State<Finished_proScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List finishedProducts = [];

  Future readData() async {
    List<Map> response =
        await sqlDb.readData("SELECT * FROM 'finishedProducts'");
    finishedProducts.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    finishedProducts = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Finished Products"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: finishedProducts.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: ListTile(
                  tileColor: const Color.fromARGB(255, 139, 187, 226),
                  textColor: Colors.indigo,
                  iconColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: const Icon(Icons.laptop_chromebook),
                  title: Text('${finishedProducts[index]['name']}'),
                  subtitle: Text(
                      'price: ${finishedProducts[index]['price']}   category:${finishedProducts[index]['cat']}'),
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
                              'DELETE FROM finishedProducts WHERE id = ${finishedProducts[index]['id']}');
                          if (response > 0) {
                            finishedProducts.removeWhere((element) =>
                                element['id'] == finishedProducts[index]['id']);
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
