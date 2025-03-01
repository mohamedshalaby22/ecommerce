import 'package:dio/dio.dart';
import 'package:ecommerce/features/Auth/signup/data/apis/signup_api_constants.dart';
import 'package:ecommerce/features/Auth/signup/data/models/signup_request_body.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/signup_response.dart';
part 'signup_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SignupApiService {
  factory SignupApiService(Dio dio) = _SignupApiService;

  @POST(SignupApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
