import '../../shared/constants.dart';

class FormUtils {
  FormUtils._();

  static bool isValidEmail(String email) {
    final emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final phoneValid = RegExp(r"0[789][01]\d{8}").hasMatch(phoneNumber);

    return phoneValid;
  }

  static bool hasDigits(String text) {
    final hasDigits = text.contains(RegExp(r'[0-9]'));
    return hasDigits;
  }

  static bool hasUppercase(String text) {
    final hasUppercase = text.contains(RegExp(r'[A-Z]'));
    return hasUppercase;
  }

  static bool hasLowercase(String text) {
    final hasLowercase = text.contains(RegExp(r'[a-z]'));
    return hasLowercase;
  }

  static bool hasSpecialCharacters(String text) {
    final hasSpecialCharacters =
        text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasSpecialCharacters;
  }

  static bool hasMinLength(String text, {int minLength = 8}) {
    final hasMinLength = text.length >= minLength;
    return hasMinLength;
  }
}

class EmailValidator {
  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Uh oh! Invalid email try again';
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static bool validateStructure(String? value) {
    //allows _ as part of special character
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[a-zA-Z0-9_\-=@,\.;]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value!);
  }

  static String? validatePassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }

      if (!validateStructure(value)) {
        return "Please enter valid password. (Min. 1 upper case \nMin. 1 lowercase \nMin. 1 Numeric Number \nMinimum 1 Special Character( ! @ # \$ & * ~ )";
      }
    } else {
      return null;
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 6) {
        return passwordLengthError;
      }
    } else {
      return null;
    }
    return null;
  }
}

class FieldValidator {
  static String? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
    } else {
      return null;
    }

    return null;
  }
}
