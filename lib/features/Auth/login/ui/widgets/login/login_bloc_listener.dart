import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/networking/api_error_model.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/widgets/app_snack_bar.dart';
import 'package:ecommerce/features/Auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: ColorsManager.mainGreen,
                  size: 40,
                ),
              ),
            );
          },
          success: (signupResponse) async {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.mainNavigationBar,
                predicate: (Route<dynamic> route) => false);
          },
          error: (apiErrorModel) {
            setupError(context: context, apiErrorModel: apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupError(
    {required BuildContext context, required ApiErrorModel apiErrorModel}) {
  context.pop();
  AppSnackBar.showSnackBarWidget(
    context: context,
    statusColor: Colors.red[300]!,
    message: apiErrorModel.getAllErrorMessages(apiErrorModel),
  );
}
