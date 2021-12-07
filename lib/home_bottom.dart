// ignore_for_file: unused_field, recursive_getters
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/explore_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeBottom extends GetxController {
  List<Widget> screens = [
    const ExploreScreen(),
    const CarScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined), label: 'Explore'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined), label: 'Account'),
  ];

  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  void chanageCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }
}
