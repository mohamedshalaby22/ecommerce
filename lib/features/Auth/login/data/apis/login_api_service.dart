import 'package:dio/dio.dart';
import 'package:ecommerce/features/Auth/signup/data/apis/signup_api_constants.dart';
import 'package:ecommerce/features/Auth/signup/data/models/signup_request_body.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import 'login_api_constants.dart';
part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(LoginApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody signupRequestBody,
  );
}
