abstract class Validator {
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Please enter your phone number';
    }

    // Should start with 9 and contain 10 digits total
    final phoneRegex = RegExp(r'^9[0-9]{8}$');
    if (!phoneRegex.hasMatch(phone)) {
      return 'Invalid phone number (e.g., 9xxxxxxxx)';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please enter your email';
    }

    final isValid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@'
      r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
      r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email.trim());

    return isValid ? null : 'Invalid email address';
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(value);
    final hasLowerCase = RegExp(r'[a-z]').hasMatch(value);
    final hasDigit = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChar = RegExp(r'[!@#$&*~]').hasMatch(value);
    final isLongEnough = value.length >= 8;

    if (!hasLowerCase || !hasUpperCase || !hasDigit || !hasSpecialChar || !isLongEnough) {
      return 'Password must contain uppercase, lowercase, number, special character and be at least 8 characters long';
    }

    return null;
  }

  static String? validateCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the verification code';
    }
    if (!RegExp(r'^\d{4}$').hasMatch(value.trim())) {
      return 'Code must be 4 digits';
    }
    return null;
  }

  static String? notNullValidation(String? str) {
    return (str == null || str.trim().isEmpty) ? 'This field is required' : null;
  }

  static String? notNullValidationEmptyString(String? str) {
    return (str == null || str.trim().isEmpty) ? '' : null;
  }
}
