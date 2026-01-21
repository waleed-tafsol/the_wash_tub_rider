import '../base_response_model.dart';

class RegisterResponseModel extends BaseApiResponseModel {
  final String token;

  RegisterResponseModel({
    required super.success,
    required super.message,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'],
      message: json['message'],
      token: json['token'],
    );
  }
}
