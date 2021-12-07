import 'package:ecommerce/getx.dart';
import 'package:ecommerce/home_screen.dart';
import 'package:ecommerce/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  const ControllerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: unnecessary_null_comparison
      //هنا لو قيمه اليوزر لانساوي نلل هيروح علي الديزاين انما لو بنل هيروح علي اللوجن سكرين
      return (Get.find<AuthViewModel>().user != null)
          ? const LayoutScreen ()
          : HomeScreen();
    });
  }
}
