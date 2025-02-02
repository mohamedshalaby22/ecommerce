import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';

class LoginOptionsRow extends StatefulWidget {
  const LoginOptionsRow({super.key});

  @override
  State<LoginOptionsRow> createState() =>
      _LoginOptionsRowState();
}

class _LoginOptionsRowState
    extends State<LoginOptionsRow> {
  bool _isKeepLoggedIn = false;

  void _toggleKeepLoggedIn() {
    setState(() {
      _isKeepLoggedIn = !_isKeepLoggedIn;
    });
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildKeepLoggedInCheckbox(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.forgotPasswordScreen);
          },
          child: Text(
            'Forget your password?',
            style: TextStyles.font12MainGreenSemiBold,
          ),
        ),
      ],
    );
  }

  GestureDetector _buildKeepLoggedInCheckbox() {
    return GestureDetector(
      onTap: _toggleKeepLoggedIn,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: _isKeepLoggedIn
                  ? ColorsManager.mainGreen
                  : Colors.transparent,
              border: Border.all(
                color: _isKeepLoggedIn ? Colors.transparent : Colors.grey,
                width: 0.6,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.check,
                color: _isKeepLoggedIn ? Colors.white : Colors.transparent,
                size: 15),
          ),
          horizontalSpace(8),
          Text('Keep me logged in', style: TextStyles.font11BlackRegular),
        ],
      ),
    );
  }
}
