import 'package:dashboard/modules/employee.dart';
import 'package:dashboard/pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Database/sql_database.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool flg = true;
  SqlDb sqlDb = SqlDb();
  Employee emp = Employee();

  bool isLoading = true;
  List users = [];
  List emails = [];
  String? password;
  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'users'");
    users.addAll(response);
    for (int i = 0; i < users.length; i++) {
      emails.add(users[i]['email']);
    }
    print(emails);
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
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xffC9DFEC),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150),
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      emp.email = value;
                      if (emails.contains(emp.email)) {
                        password = users[emails.indexOf(emp.email)]['password'];
                        print(password);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Enter your E-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        emp.password = value;
                      },
                      obscureText: flg,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                flg = !flg;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye_rounded)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                MaterialButton(
                    elevation: 5,
                    color: const Color(0xff2B3856),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 80,
                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (users.isEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                      }
                      if (!emails.contains(emp.email) ||
                          password != emp.password) {
                        Fluttertoast.showToast(
                            msg: 'Please enter a valid email and password',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.yellow);
                        return;
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    }),
              ],
            ),
          )),
    );
  }
}
