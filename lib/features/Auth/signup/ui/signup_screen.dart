import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/Auth/signup/ui/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/theming/styles.dart';
import 'widgets/signup_form.dart';
import 'widgets/social_sign_in_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupForm(),
        verticalSpace(25),
        AppTextButton(buttonText: 'Sign up', onPressed: () {}),
        verticalSpace(20),
        AppTextButton(
          backgroundColor: Colors.transparent,
          borderColor: ColorsManager.mainGreen,
          textStyle: TextStyles.font1MainGreenMedium,
          buttonText: 'Continue as a guest',
          onPressed: () {},
        ),
        verticalSpace(20),
        const OrDivider(text: 'Sign up',),
        verticalSpace(20),
        Row(
          children: [
            SocialSignInButton(
                image: Assets.svgsGoogle, title: 'Google', onTap: () {}),
            horizontalSpace(15),
            SocialSignInButton(
                image: Assets.svgsApple, title: 'Apple ID', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
