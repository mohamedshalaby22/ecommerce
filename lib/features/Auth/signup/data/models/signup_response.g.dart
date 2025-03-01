// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone_number'] as String,
      email: json['email'] as String,
      accessToken: json['access'] as String,
      refreshToken: json['refresh'] as String,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phone,
      'email': instance.email,
      'access': instance.accessToken,
      'refresh': instance.refreshToken,
    };
