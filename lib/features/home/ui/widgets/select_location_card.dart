import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SelectLocationCard extends StatelessWidget {
  const SelectLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0x15898121),
        ),
        child: Row(
          children: [
            Text(
              'Deliver to select current location',
              style: TextStyles.font14MainGreenSemiBold,
            ),
            const Spacer(),
            const HugeIcon(
                icon: HugeIcons.strokeRoundedLocation06,
                color: ColorsManager.mainGreen)
          ],
        ),
      ),
    );
  }
}
