// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:ecommerce/home_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBottom>(
      init: HomeBottom(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (index) => controller.chanageCurrentIndex(index),
            showUnselectedLabels: false,
            selectedItemColor: const Color(0xff09c16d),
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0.0,
            items: controller.bottomItems),
        body: controller.screens[controller.currentIndex],
      ),
    );
  }
}
