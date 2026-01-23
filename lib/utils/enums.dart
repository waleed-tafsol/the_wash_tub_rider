enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  register("auth/register"),
  login("auth/login");

  final String url;

  const EndPoints(this.url);
}

enum BaseUrl {
  stagUrl("https://gsxbsrfj-8081.euw.devtunnels.ms/api/");

  final String url;

  const BaseUrl(this.url);
}

enum DesignType { tablet, smallTablet, mobile }

enum Role { admin, customer }

enum Status { active, systemDeactivated, verificationPending, inactive }

enum PLATFORM { local, google, apple }

enum ContactMedium { whatsapp, sms }
