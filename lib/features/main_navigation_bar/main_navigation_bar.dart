import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../core/theming/colors.dart';
import 'navigation_items.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() =>
      _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _selectedIndex,
          children:
              navigationItems.map((item) => item.page).toList()),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 0.01, spreadRadius: 0.01)
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsManager.mainGreen,
          onTap: (int index) {
            HapticFeedback.selectionClick();
            setState(() => _selectedIndex = index);
          },
          items: navigationItems.map((item) {
            bool isSelected = _selectedIndex == navigationItems.indexOf(item);
            return BottomNavigationBarItem(
              icon: HugeIcon(
                icon: item.icon,
                size: 25,
                color: isSelected ? ColorsManager.mainBlue : Colors.grey,
              ),
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }
}
