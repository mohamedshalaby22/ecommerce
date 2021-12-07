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
    _cartModel = await CartDatabaseHelper.getAllproducts();
    _loading.value = false;
    update();
  }

  //هنا هعمل فانكشن لم بدوس علي زرار الادد بتودي المنتج للكارت سكرين
  addProduct(CartModel cartModel) async {
    await CartDatabaseHelper.insert(cartModel);
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
