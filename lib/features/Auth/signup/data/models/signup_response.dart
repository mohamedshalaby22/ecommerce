import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'phone_number')
  String phone;
  String email;
  @JsonKey(name: 'access')
  String accessToken;
  @JsonKey(name: 'refresh')
  String refreshToken;

  SignupResponse({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
