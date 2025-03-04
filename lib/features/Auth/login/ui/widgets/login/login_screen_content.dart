import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/di/dependency_injection.dart';
import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/Auth/login/logic/cubit/login_cubit.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/login/auth_toggle.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/login/login_form.dart';
import 'package:ecommerce/features/Auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../signup/ui/signup_screen.dart';
import '../../../../signup/ui/widgets/or_divider.dart';
import '../../../../signup/ui/widgets/social_sign_in_button.dart';
import 'login_bloc_listener.dart';

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(10),
              AuthToggle(
                onLoginPressed: (int selectedIndex) {
                  setState(() {
                    _selectedIndex = selectedIndex;
                  });
                },
              ),
              verticalSpace(30),
              if (_selectedIndex == 0)
                Column(
                  children: [
                    const LoginForm(),
                    verticalSpace(25),
                    AppTextButton(
                        buttonText: 'Login',
                        onPressed: () {
                          validateAndLogin(context: context);
                        }),
                    verticalSpace(20),
                    const LoginBlocListener(),
                    // AppTextButton(
                    //   backgroundColor: Colors.transparent,
                    //   borderColor: ColorsManager.mainGreen,
                    //   textStyle: TextStyles.font16MainGreenMedium,
                    //   buttonText: 'Continue as a guest',
                    //   onPressed: () {},
                    // ),
                    // verticalSpace(20),
                    // const OrDivider(),
                    // verticalSpace(30),
                    // Row(
                    //   children: [
                    //     SocialSignInButton(
                    //         image: Assets.svgsGoogle,
                    //         title: 'Google',
                    //         onTap: () {}),
                    //     horizontalSpace(15),
                    //     SocialSignInButton(
                    //         image: Assets.svgsApple,
                    //         title: 'Apple ID',
                    //         onTap: () {}),
                    //   ],
                    // ),
                  ],
                )
              else
                BlocProvider(
                  create: (BuildContext context) => SignUpCubit(getIt()),
                  child: const SignupScreen(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndLogin({required BuildContext context}) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
