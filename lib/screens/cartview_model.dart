import 'package:ecommerce/database_helper.dart';
import 'package:ecommerce/screens/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  int counter = 1;
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartModel> _cartModel = [];
  List<CartModel> get cartModel => _cartModel;
  CartViewModel() {
    getAllProducts();
  }
  //هنا هعمل ميثود تجيب الداتا كلها من الداتابيز
  getAllProducts() async {
    _loading.value = true;

    var dbHelper = CartDatabaseHelper.db;
    _cartModel = await dbHelper.getAllproducts();
    print(cartModel.length);
    _loading.value = false;
  }

  //هنا هعمل فانكشن لم بدوس علي زرار الادد بتودي المنتج للكارت سكرين
  addProduct(CartModel cartModel) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartModel);
    update();
  }

  void addcounter() {
    counter++;
    update();
  }

  void removecounter() {
    counter--;
    update();
  }
}
