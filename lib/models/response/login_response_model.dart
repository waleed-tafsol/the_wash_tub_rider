import '../base_response_model.dart';

class LoginResponseModel extends BaseApiResponseModel {
  final String token;

  LoginResponseModel({
    required super.success,
    required super.message,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      token: json['token'],
    );
  }
}
