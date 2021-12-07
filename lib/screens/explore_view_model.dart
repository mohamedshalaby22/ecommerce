// ignore_for_file: avoid_print, prefer_final_fields, unused_field
import 'package:ecommerce/screens/categories.dart';
import 'package:ecommerce/screens/products.dart';
import 'package:ecommerce/screens/servercies.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//هنا بجيب الداتا من الفايربيز
class ExploreViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoriesModel> get categoriesModel => _categoriesModel;
  List<CategoriesModel> _categoriesModel = [];
  List<ProductsModel> get productsModel => _productsModel;
  List<ProductsModel> _productsModel = [];

// بعمل انستانس من هنا بنادي علي الميثود بتاعتي
  ExploreViewModel() {
    getCategories();
    getBestSellingProducts();
  }
  Future<void> getCategories() async {
    _loading.value = true;
    await HomeServerices().getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoriesModel.add(CategoriesModel.fromJson(value[i].data() as Map));
        // print(_categoriesModel.length);

        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    await HomeServerices().getBestSellingProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(ProductsModel.fromJson(value[i].data() as Map));

        ///print(_productsModel.length);
        ///print('+++++++++++++++++++++++++++');
        _loading.value = false;
      }
      update();
    });
  }
}
