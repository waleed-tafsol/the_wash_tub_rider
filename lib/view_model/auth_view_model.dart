
import 'package:the_wash_tub_rider/models/request/register_request_model.dart';
import 'package:the_wash_tub_rider/models/response/login_response_model.dart';
import 'package:the_wash_tub_rider/services/auth_services.dart';

import '../models/request/login_request_model.dart';
import '../utils/base_notifier.dart';

class AuthViewModel extends BaseNotifier {
  late LoginResponseModel loginResponse;
  final AuthService _authService = AuthService();

  Future<bool> login({required LoginRequestModel loginReq}) async {
    return await safeAction<bool>(showLoading: true, () async {
          final response = await _authService.login(req: loginReq);
          if (!response.success) {
            return false;
          }
          loginResponse = response;
          return true;
        }) ??
        false;
  }

  Future<bool> register(RegisterRequestModel req) async {
    return await safeAction<bool>(showLoading: true, () async {
          final response = await _authService.register(req: req);
          return response.success;
        }) ??
        false;
  }
}
