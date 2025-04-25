final class Validator {
  Validator._();

  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  static bool validPostCode(String code) {
    final postcodeRegex = RegExp(
      r'^[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}$',
      caseSensitive: true,
    );
    return postcodeRegex.hasMatch(code);
  }

  static bool isValidPassword(String password) {
    final passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  static bool isValidText(String text) {
    final textRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,9}$');
    return textRegExp.hasMatch(text);
  }

  static isValidPhoneNumber(String phoneNumber) {
    final phoneRegExp = RegExp(r'^\+947\d{9}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }
}
