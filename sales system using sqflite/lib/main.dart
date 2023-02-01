import 'package:dashboard/Database/sql_database.dart';
import 'package:dashboard/all%20categories/all_categories.dart';
import 'package:dashboard/pages/Head%20phone/headphone_screen.dart';
import 'package:dashboard/pages/Screens/transaction.dart';
import 'package:dashboard/pages/other_devices/other_screen.dart';
import 'package:dashboard/pages/Home_Page.dart';
import 'package:dashboard/pages/Laptop/laptop_screen.dart';
import 'package:dashboard/pages/PC/pc_screen.dart';
import 'package:dashboard/pages/Phones/phone_screen.dart';
import 'package:dashboard/temp/Screen_BestSeller.dart';
import 'package:dashboard/pages/Screens/Screen_Category.dart';
import 'package:dashboard/pages/Screens/Screen_Finished_pro.dart';
import 'package:dashboard/temp/Screen_LeastSelling.dart';
import 'package:dashboard/temp/Screen_Sales.dart';
import 'package:dashboard/pages/Tablet/tablet_screen.dart';
import 'package:dashboard/users/users_screen.dart';
import 'pages/Screens/Login_Page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqlDb sqlDb = SqlDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        home: const Login_page(),
        routes: {
          'homePage': (context) => HomePage(),
          "category": (context) => CategoryScreen(),
          "Finished_Product": (context) => const Finished_proScreen(),
          "Sales": (context) => SalesScreen(),
          "BestSeller": (context) => Best_Seller_Screen(),
          "Least Selling": (context) => Least_Selling_Screen(),
          //phones
          "Phones": (context) => const PhonesScreen(),
          //laptop
          "Laptop": (context) => const LaptopsScreen(),
          // pc
          "PC": (context) => const PcScreen(),
          //Tablet
          "Tablet": (context) => const TabletsScreen(),
          //Headphones
          'HeadPhone': (context) => const HeadPhones(),
          //Other
          'OtherCat': (context) => const OtherCat(),
          //users page
          'Users': (context) => const UsersScreen(),
          //all
          'all': (context) => const allScreen(),
        });
  }
}
