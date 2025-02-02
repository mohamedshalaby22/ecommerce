import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/phone_number_form_field.dart';
import 'terms_and_conditions_text.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'User Name',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              Assets.svgsUser,
              fit: BoxFit.contain,
            ),
          ),
          validator: (value) {},
        ),
        verticalSpace(15),
        PhoneNumberFormField(
          phoneController: TextEditingController(),
        ),
        verticalSpace(15),
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
          controller: passwordController,
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
        verticalSpace(15),
        AppTextFormField(
          isObscureText: isPasswordConfirmationObscureText,
          hintText: 'Confirm Password',
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
                isPasswordConfirmationObscureText =
                    !isPasswordConfirmationObscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                isPasswordConfirmationObscureText
                    ? Assets.svgsEyeClosed
                    : Assets.svgsEyeOpen,
                fit: BoxFit.contain,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid confirmation password';
            }
          },
        ),
        verticalSpace(15),
        const TermsAndConditionsText(),
      ],
    );
  }
}
