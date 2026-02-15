import 'package:flutter/material.dart';

String? userValidator(value) {
  RegExp usernameRegEx = RegExp(r'^[a-zA-Z][a-zA-Z0-9_.]{2,19}$');
  if (value == null || value.trim().isEmpty) {
    return 'this filed is required';
  }
  if (!usernameRegEx.hasMatch(value)) {
    return 'this input is not allowed';
  }
  return null;
}

String? emailValidator(value) {
  
  RegExp emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value == null || value.trim().isEmpty) {
    return 'this filed is required';
  }
  if (!emailRegEx.hasMatch(value)) {
    return 'this input is not allowed';
  }
  return null;
}

String? passValidator(value) {
  RegExp passRegEx = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );
  if (value == null || value.trim().isEmpty) {
    return 'this filed is required';
  }
  if (!passRegEx.hasMatch(value)) {
    return 'this input is not allowed';
  }
  return null;
}

String? rePassValidator({
  required value,
  required TextEditingController passController,
  required TextEditingController rePassController,
}) {
  if (value == null || value.trim().isEmpty) {
    return 'this filed is required';
  }
  if (passController.text != rePassController.text) {
    return 'password not matched';
  }
  return null;
}
