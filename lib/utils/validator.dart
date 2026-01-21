class Validators {
  Validators._(); // private constructor

  /// Empty field validator
  static String? empty(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Email validator
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Password validator
  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  /// Phone number validator
  /// Accepts numbers with optional country code
  static String? phone(
    String? value, {
    int minLength = 10,
    int maxLength = 15,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    // Remove spaces, dashes, parentheses
    final cleaned = value.replaceAll(RegExp(r'[^\d+]'), '');

    final phoneRegex = RegExp(r'^\+?[0-9]+$');

    if (!phoneRegex.hasMatch(cleaned)) {
      return 'Enter a valid phone number';
    }

    if (cleaned.replaceAll('+', '').length < minLength ||
        cleaned.replaceAll('+', '').length > maxLength) {
      return 'Phone number must be between $minLength and $maxLength digits';
    }

    return null;
  }
}
