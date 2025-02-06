import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class FilterSearchSheetAppBar extends StatelessWidget {
  const FilterSearchSheetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 4,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter your search',
                  style: TextStyles.font18BlackSemiBold,
                ),
                verticalSpace(5),
                Text(
                  'Select all filters you prefer for your search',
                  style: TextStyles.font12GreyRegular,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedCancelCircleHalfDot,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
        verticalSpace(10),
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}
