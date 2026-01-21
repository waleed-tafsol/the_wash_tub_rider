class RegisterRequestModel {
  final String email;
  final String password;
  final String phoneNumber;
  final String cc;
  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.cc,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'cc': cc,
    };
  }
}
