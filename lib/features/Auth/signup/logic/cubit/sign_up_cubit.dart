import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/signup_request_body.dart';
import '../../data/repos/signup_repo.dart';
part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(const SignupState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(success: (signupResponse) async {
      await TokenStorage.saveTokens(
        accessToken: signupResponse.access,
        refreshToken: signupResponse.refresh,
      );
      emit(SignupState.success(signupResponse));
    }, failure: (error) {
      emit(SignupState.error(error: error.toString()));
    });
  }
}
