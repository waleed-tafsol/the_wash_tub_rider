import 'package:http/http.dart';
import 'package:the_wash_tub_rider/models/request/register_request_model.dart';
import 'package:the_wash_tub_rider/models/response/login_response_model.dart';
import 'package:the_wash_tub_rider/models/response/register_response_model.dart';
import 'package:the_wash_tub_rider/utils/enums.dart';
import 'package:the_wash_tub_rider/utils/exception.dart';

import 'package:the_wash_tub_rider/utils/secure_storage_services.dart';
import '../models/request/login_request_model.dart';
import 'api_base_helper.dart';

class AuthService {
  final ApiBaseHelper _api;
  final SecureStorageService _storage;

  AuthService({ApiBaseHelper? api, SecureStorageService? storage})
    : _api = api ?? ApiBaseHelper(),
      _storage = storage ?? SecureStorageService();

  Future<LoginResponseModel> login({required LoginRequestModel req}) async {
    final jsonResponse = await _api.post(EndPoints.login, body: req.toJson());
    final response = LoginResponseModel.fromJson(jsonResponse);

    if (!response.success) {
      throw BadRequestException(response.message);
    }
    await _storage.saveToken(response.token);
    return response;
  }

  Future<RegisterResponseModel> register({
    required RegisterRequestModel req,
  }) async {
    final jsonres = await _api.post(EndPoints.register, body: req.toJson());
    final response = RegisterResponseModel.fromJson(jsonres);

    if (!response.success) {
      throw BadRequestException(response.message);
    }
    await _storage.saveToken(response.token);
    return response;
  }

  Future<void> logout() async {
    await _storage.clearToken();
  }

  bool get isLoggedIn => _storage.isLoggedIn;
}
