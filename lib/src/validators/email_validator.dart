class EmailValidator {
  static bool emailValidator(String value) {
    const String emailRegex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
    return RegExp(emailRegex).hasMatch(value);
  }
}
