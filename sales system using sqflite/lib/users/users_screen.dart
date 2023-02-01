import 'package:flutter/material.dart';

import '../../Database/sql_database.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  SqlDb sqlDb = SqlDb();

  bool isLoading = true;

  List users = [];

  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'users'");
    users.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    users = [];
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Users"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: users.length,
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
                  leading: const Icon(Icons.computer_outlined),
                  title: Text('${users[index]['name']}'),
                  subtitle: Text(
                      'salary: ${users[index]['salary']}  access:${users[index]['access']}  email:${users[index]['email']}  password:${users[index]['password']}'),
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
                              'DELETE FROM users WHERE id = ${users[index]['id']}');
                          if (response > 0) {
                            users.removeWhere((element) =>
                                element['id'] == users[index]['id']);
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
