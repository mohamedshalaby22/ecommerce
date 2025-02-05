import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class NavigationItem {
  final String label;
  final IconData icon;
  final Widget page;

  NavigationItem({required this.label, required this.icon, required this.page});
}

final List<NavigationItem> navigationItems = [
  
  NavigationItem(
    label: 'Home',
    icon: HugeIcons.strokeRoundedHome01,
    page: const HomeScreen(),
  ),
  NavigationItem(
    label: 'Wishlist',
    icon: HugeIcons.strokeRoundedFavourite,
    page: Container(color: Colors.red[300]),
  ),
  NavigationItem(
    label: 'Search',
    icon: HugeIcons.strokeRoundedSearch01,
    page: Container(color: Colors.yellow[300]),
  ),
  NavigationItem(
    label: 'Cart',
    icon: HugeIcons.strokeRoundedShoppingCart01,
    page: Container(color: Colors.green[300]),
  ),
  NavigationItem(
    label: 'Profile',
    icon: HugeIcons.strokeRoundedUser,
    page: Container(color: Colors.blue[300]),
  ),
];
