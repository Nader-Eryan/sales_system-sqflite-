import 'package:dashboard/Database/sql_database.dart';
import 'package:dashboard/Helper/Helper_Add_Product.dart';
import 'package:dashboard/modules/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Add_Product extends StatefulWidget {
  const Add_Product({Key? key}) : super(key: key);

  @override
  State<Add_Product> createState() => _Add_ProductState();
}

class _Add_ProductState extends State<Add_Product> {
  SqlDb sqlDb = SqlDb();
  ProductModel productModel = ProductModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2B3856),
        title: const Text("Add New Product"),
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
                  Label: 'Product Name',
                  Hint: 'Enter Product Name',
                  keyboard: TextInputType.name,
                  onSaved: (val) {
                    setState(() {
                      productModel.name = val;
                      //print(productModel.name);
                    });
                  },
                ),
                Add(
                  Label: 'Product Category',
                  Hint: 'Enter Product category',
                  keyboard: TextInputType.text,
                  onSaved: (val) {
                    setState(() {
                      productModel.cat = val;
                    });
                  },
                ),
                Add(
                  keyboard: TextInputType.number,
                  Label: 'Price',
                  Hint: 'Enter Product price',
                  onSaved: (val) {
                    setState(() {
                      productModel.price = int.parse(val!);
                    });
                  },
                ),
                Add(
                  keyboard: TextInputType.number,
                  Label: 'Product Initial Amount',
                  Hint: 'Enter Initial Amount',
                  onSaved: (val) {
                    setState(() {
                      productModel.initialAmount = int.parse(val!);
                    });
                  },
                ),
                Add(
                  keyboard: TextInputType.name,
                  Label: 'Product Description',
                  Hint: 'Enter a brief description',
                  onSaved: (val) {
                    setState(() {
                      productModel.description = val;
                    });
                  },
                ),
                Add(
                  keyboard: TextInputType.name,
                  Label: 'Product Image link',
                  Hint: 'Enter a valid(complete) image link',
                  onSaved: (val) {
                    setState(() {
                      productModel.img = val;
                    });
                  },
                ),
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
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    // int response = await sqlDb.insertData('''
                    //   INSERT INTO "notes" ( `name` , `cat` , `price` , `initialAmount` ) VALUES ("${product.name}","${product.cat}","${product.price}","${product.initialAmount}")
                    // ''');
                    if (productModel.name == null ||
                        productModel.initialAmount == null ||
                        productModel.cat == null ||
                        productModel.price == null ||
                        productModel.description == null ||
                        productModel.img == null) {
                      Fluttertoast.showToast(
                          msg: 'Please enter falid data',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.yellow);
                      return;
                    }
                    int response = await sqlDb.insert("products", {
                      "name": productModel.name!,
                      "cat": productModel.cat!,
                      "initialAmount": productModel.initialAmount!,
                      "price": productModel.price!,
                      "description": productModel.description!,
                      "img": productModel.img!,
                    });
                    if (response > 0) {
                      Navigator.of(context).pushReplacementNamed('homePage');
                    } else {
                      print('product insertion error!');
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
