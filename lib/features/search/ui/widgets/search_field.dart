import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key, required this.controller, required this.onChange});
  final TextEditingController controller;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
        controller: controller,
        onChange: (value) {
          onChange(value);
        },
        prefixIcon: const HugeIcon(
          icon: HugeIcons.strokeRoundedSearch01,
          color: Colors.grey,
          size: 22,
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.all(7),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: ColorsManager.mainGreen,
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedFilter,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        hintText: 'Search by category here...',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        });
  }
}
