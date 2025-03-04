import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessages(ApiErrorModel apiErrorModel) {
    String errorMessage = '';
    apiErrorModel.errors?.forEach((key, value) {
      errorMessage += '$key: $value\n';
    });
    return errorMessage;
  }
}
