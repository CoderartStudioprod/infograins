class Validator {
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  static RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  static RegExp doubleRegex = RegExp(r'^(?:0|[1-9][0-9]*)\.[0-9]+$');

  static RegExp name = RegExp(r'[a-z A-Z]');

  static String? emailValidator(String email) {
    if (email.isEmpty) {
      return null;
    }

    if (!emailRegex.hasMatch(email)) {
      return 'Invalid Email Address';
    }
    return null;
  }

  static String? passwordValidator(String password) {
    if (password.isEmpty) {
      return "Please Provide a valid passward";
    }
    // if (!passwordRegex.hasMatch(password)) {
    //   return '';
    // }
    return null;
  }

  static String? oTPValidator(String password) {
    if (password.isEmpty && password.toString().length < 3) {
      return "Please Provide a valid OTP";
    }
    // if (!passwordRegex.hasMatch(password)) {
    //   return '';
    // }
    return null;
  }
}
