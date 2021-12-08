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
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProducts();
  }
  //هنا هعمل ميثود تجيب الداتا كلها من الداتابيز
  getAllProducts() async {
    _loading.value = true;
    _cartModel = await CartDatabaseHelper.getAllproducts();
    _loading.value = false;

    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartModel.length; i++) {
      //هنا بجيب السعر عشان لو زودت المنتج مرتين ولا حاجه
      //وبحول السعر من عدد صحيح لعدد عشري لان السعر ممكن يكون كسور
      _totalPrice +=
          (double.parse(_cartModel[i].price) * _cartModel[i].quanity);
      //print(_totalPrice);
      update();
    }

    update();
  }

  //هنا هعمل فانكشن لم بدوس علي زرار الادد بتودي المنتج للكارت سكرين
  //بعمل فورلوب علي اللسته بتاعتي من خلال الاي دي لو لقا منتج نفس الاي دي مش هيضفه

  addProduct(CartModel cartModel) async {
    //بعمل فورلوب علي اللسته بتاعتي من خلال الاي دي لو لقا منتج نفس الاي دي مش هيضفه
    for (int i = 0; i < _cartModel.length; i++) {
      if (_cartModel[i].productId == cartModel.productId) {
        return;
      }
    }
    await CartDatabaseHelper.insert(cartModel);
    _cartModel.add(cartModel);
    _totalPrice += (double.parse(cartModel.price) * cartModel.quanity);

    await CartDatabaseHelper.insert(cartModel);

    update();
  }

  void addcounter(int index) async {
    _cartModel[index].quanity++;
    _totalPrice += (double.parse(_cartModel[index].price));
    await dbHelper.updateProduct(_cartModel[index]);
    update();
  }

  void removecounter(int index) async {
    _cartModel[index].quanity--;
    _totalPrice -= (double.parse(_cartModel[index].price));
    await dbHelper.updateProduct(_cartModel[index]);
    update();
  }
}
