// ignore_for_file: file_names

import 'package:auvnet_task/core/constant.dart';

class Validator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    if (!RegExp(Constant.regExValidateEmail).hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String _passwordValue = "";
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must contain at least one special character";
    }
    _passwordValue = value;
    return null;
  }

  static String? confirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm password can't be empty";
    }
    if (value != _passwordValue) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return "Username can't be empty";
    }
    if (value.length > 20) {
      return "Username can't be more than 20 characters";
    }
    return null;
  }

  static String? firstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name can't be empty";
    }
    if (value.length > 20) {
      return "First name can't be more than 20 characters";
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name can't be empty";
    }
    if (value.length > 20) {
      return "Last name can't be more than 20 characters";
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number can't be empty";
    }
    if (value.length > 20) {
      return "Phone number can't be more than 20 characters";
    }
    return null;
  }
}
