import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsAndConditionsText extends StatefulWidget {
  const TermsAndConditionsText({super.key});

  @override
  State<TermsAndConditionsText> createState() => _TermsAndConditionsTextState();
}

class _TermsAndConditionsTextState extends State<TermsAndConditionsText> {
  bool isAcceptedTermes = false;
  void _toggleAcceptedTermes() {
    setState(() {
      isAcceptedTermes = !isAcceptedTermes;
    });
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAcceptedTermes,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isAcceptedTermes
                  ? ColorsManager.mainGreen
                  : Colors.transparent,
              border: Border.all(
                color: isAcceptedTermes ? Colors.transparent : Colors.grey,
                width: 0.6,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.check,
                color: isAcceptedTermes ? Colors.white : Colors.transparent,
                size: 15),
          ),
          horizontalSpace(8),
          Row(
            children: [
              Text('You must accept ',
                  style: TextStyles.font11BlackRegular),
              Text('terms & conditions*',
                  style: TextStyles.font11MainGreenRegular),
            ],
          ),
        ],
      ),
    );
  }
}
