import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/Auth/signup/data/apis/signup_api_service.dart';
import '../models/signup_request_body.dart';
import '../models/signup_response.dart';

class SignupRepo {
  final SignupApiService _signupApiService;
  SignupRepo(this._signupApiService);
  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _signupApiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
