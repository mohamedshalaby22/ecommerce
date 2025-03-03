import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/Auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/signup_bloc_listener.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupForm(),
        verticalSpace(50),
        AppTextButton(
            buttonText: 'Sign up',
            onPressed: () {
              validateFormAndSignUp(context: context);
            }),
        verticalSpace(20),
        const SignupBlocListener(),
        // AppTextButton(
        //   backgroundColor: Colors.transparent,
        //   borderColor: ColorsManager.mainGreen,
        //   textStyle: TextStyles.font16MainGreenMedium,
        //   buttonText: 'Continue as a guest',
        //   onPressed: () {},
        // ),
        // verticalSpace(20),
        // const OrDivider(text: 'Sign up',),
        // verticalSpace(20),
        // Row(
        //   children: [
        //     SocialSignInButton(
        //         image: Assets.svgsGoogle, title: 'Google', onTap: () {}),
        //     horizontalSpace(15),
        //     SocialSignInButton(
        //         image: Assets.svgsApple, title: 'Apple ID', onTap: () {}),
        //   ],
        // ),
      ],
    );
  }

  void validateFormAndSignUp({required BuildContext context}) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignupStates();
    }
  }
}
