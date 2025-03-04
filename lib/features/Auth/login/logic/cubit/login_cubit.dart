import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/networking/api_error_model.dart';
import 'package:ecommerce/features/Auth/login/data/models/login_request_body.dart';
import 'package:ecommerce/features/Auth/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(success: (loginResponse) async {
      await TokenStorage.saveTokens(
        accessToken: loginResponse.access,
        refreshToken: loginResponse.refresh,
      );
      emit(LoginState.success(loginResponse));
    }, failure: (apiErrorModel) {
      emit(LoginState.error(apiErrorModel));
    });
  }
}
