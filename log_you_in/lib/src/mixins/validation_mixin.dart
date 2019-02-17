class ValidationMixin {
  String validateEmail(String text) {
    return text.contains("@") ? null : "Username must be a valid email";
  }

  String validatePassword(String text) {
    return text.length > 4
        ? null
        : "Password must be at least 4 characters long";
  }
}
