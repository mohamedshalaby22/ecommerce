// ignore_for_file: must_be_immutable
import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/font_weight_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyTermsTab extends StatefulWidget {
  const PrivacyTermsTab({super.key, required this.onTabChanged});

  final Function(int selectedIndex) onTabChanged;

  @override
  State<PrivacyTermsTab> createState() => _PrivacyTermsTabState();
}

class _PrivacyTermsTabState extends State<PrivacyTermsTab> {
  final List<String> tabs = ['Privacy Policy', 'Terms & Conditions'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        thumbColor: ColorsManager.mainGreen,
        backgroundColor: ColorsManager.lightGreen,
        groupValue: selectedIndex,
        children: {
          for (int i = 0; i < tabs.length; i++)
            i: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                tabs[i],
                style: TextStyle(
                  color: selectedIndex == i
                      ? Colors.white
                      : ColorsManager.mainGreen,
                  fontFamily: AppConstants.appFontFamily,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
        },
        onValueChanged: (value) {
          setState(() {
            selectedIndex = value as int;
            widget.onTabChanged(selectedIndex);
          });
        },
      ),
    );
  }
}
