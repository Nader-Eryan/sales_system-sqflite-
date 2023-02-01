import 'package:dashboard/Helper/Helper_Add_Product.dart';
import 'package:dashboard/modules/employee.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

import '../Database/sql_database.dart';

class Add_Employee extends StatefulWidget {
  const Add_Employee({Key? key}) : super(key: key);

  @override
  State<Add_Employee> createState() => _Add_EmployeeState();
}

class _Add_EmployeeState extends State<Add_Employee> {
  SqlDb sqlDb = SqlDb();
  Employee emp = Employee();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2B3856),
        title: const Text("Add New Employee"),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xffC9DFEC),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Add(
                  Label: 'Employee Name',
                  Hint: 'Enter Employee Name',
                  onSaved: (val) {
                    emp.name = val!;
                  },
                  keyboard: TextInputType.name,
                ),
                Add(
                  keyboard: TextInputType.number,
                  Label: 'Employee Salary',
                  Hint: 'Enter Employee Salary',
                  onSaved: (val) {
                    emp.salary = int.parse(val!);
                  },
                ),
                Add(
                  keyboard: TextInputType.emailAddress,
                  Label: 'Employee E-mail',
                  Hint: 'Enter Employee E-mail',
                  onSaved: (val) {
                    emp.email = val;
                  },
                ),
                Add(
                  Label: 'Employee Password',
                  Hint: 'Enter Employee Password',
                  keyboard: TextInputType.visiblePassword,
                  onSaved: (val) {
                    emp.password = val;
                  },
                ),
                Add(
                  Label: 'Employee access',
                  Hint: 'Enter Employee access',
                  keyboard: TextInputType.name,
                  onSaved: (val) {
                    emp.access = val;
                  },
                ),
                const SizedBox(height: 5),
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
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    // int response = await sqldb.insertData('''
                    //   INSERT INTO "notes" ( `title` , `note` ) VALUES ("${title.text}","${note.text}")
                    // ''');
                    if (emp.name == null ||
                        emp.email == null ||
                        emp.password == null ||
                        emp.salary == null ||
                        emp.access == null) {
                      Fluttertoast.showToast(
                          msg: 'Please enter falid data',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.yellow);
                      return;
                    }
                    int response = await sqlDb.insert("users", {
                      "name": emp.name,
                      "salary": emp.salary,
                      "email": emp.email,
                      "password": emp.password,
                      "access": emp.access,
                    });
                    if (response > 0) {
                      Navigator.of(context).pushReplacementNamed('homePage');
                    } else {
                      print('employee insertion error!');
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
