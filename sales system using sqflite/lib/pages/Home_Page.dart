import 'package:dashboard/pages/Add_Employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/Helper_Home_Page.dart';
import 'Add_Product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff2B3856),
        child: ListView(
          children: [
            Image.asset('images/electronic.jpg'),
            Card(
              shadowColor: Colors.black,
              color: const Color(0xffC9DFEC),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Add_Product()));
                },
                leading: const Icon(Icons.add),
                title: const Text(
                  'Add New Product',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              color: const Color(0xffC9DFEC),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Add_Employee()));
                },
                leading: const Icon(Icons.add),
                title: const Text(
                  'Add New Employee',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Dashboard"), centerTitle: true),
      body: Stack(children: [
        // Container(
        //           height: 100,
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                   image: AssetImage('images/'),
        //                   fit: BoxFit.fitWidth)),
        //         ),
        Container(
          // margin: EdgeInsets.only(top: 250),
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              Help(
                  title: "Category",
                  icon: Icons.category,
                  color: Colors.blue,
                  background: Colors.lime,
                  routes: "category"),
              Help(
                  title: "Finished Product",
                  icon: Icons.battery_0_bar,
                  color: Colors.red,
                  background: Colors.blueGrey,
                  routes: "Finished_Product"),
              Help(
                  title: "Users",
                  icon: Icons.people,
                  color: Colors.indigo,
                  background: Colors.blueGrey,
                  routes: "Users"),
              Help(
                  title: "All products",
                  icon: Icons.bar_chart,
                  color: Colors.green,
                  background: Colors.yellow,
                  routes: "all"),
            ],
          ),
        ),
      ]),
    );
  }
}
