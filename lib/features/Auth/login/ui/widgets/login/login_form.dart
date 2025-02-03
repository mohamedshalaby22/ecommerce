import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_images.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import 'login_options_row.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'Email',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              Assets.svgsEmail,
              fit: BoxFit.contain,
            ),
          ),
          validator: (value) {},
        ),
        verticalSpace(15),
        AppTextFormField(
          isObscureText: isPasswordObscureText,
          hintText: 'Password',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              Assets.svgsLock,
              fit: BoxFit.contain,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordObscureText = !isPasswordObscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                isPasswordObscureText
                    ? Assets.svgsEyeClosed
                    : Assets.svgsEyeOpen,
                fit: BoxFit.contain,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid password';
            }
          },
        ),
        verticalSpace(20),
        const LoginOptionsRow(),
      ],
    );
  }
}
