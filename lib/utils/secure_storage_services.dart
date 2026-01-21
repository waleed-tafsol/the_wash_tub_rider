import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  static const _tokenKey = 'auth_token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? _token;

  /// Call this once at app start
  Future<void> init() async {
    _token = await _storage.read(key: _tokenKey);
  }

  String? get token => _token;

  bool get isLoggedIn => _token != null;

  Future<void> saveToken(String token) async {
    _token = token;
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> clearToken() async {
    _token = null;
    await _storage.delete(key: _tokenKey);
  }
}
