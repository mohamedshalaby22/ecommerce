import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/phone_number_form_field.dart';
import '../../logic/cubit/sign_up_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'First Name',
            controller: context.read<SignUpCubit>().firstNameController,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                Assets.svgsUser,
                fit: BoxFit.contain,
              ),
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your first name';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'Last Name',
            controller: context.read<SignUpCubit>().lastNameController,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                Assets.svgsUser,
                fit: BoxFit.contain,
              ),
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your last name';
              }
            },
          ),
          verticalSpace(15),
          PhoneNumberFormField(
            phoneController: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'Email',
            controller: context.read<SignUpCubit>().emailController,
            textInputType: TextInputType.emailAddress,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                Assets.svgsEmail,
                fit: BoxFit.contain,
              ),
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your email';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
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
        ],
      ),
    );
  }
}
