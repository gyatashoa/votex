import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class MainFormModel extends FormViewModel {
  String get errorMsg1 => 'Invalid email!';
  String get errorMsg2 => 'length too short!';
  String get errorMsg3 => 'Length should be greater than 5!';
  String get errorMsg4 => 'Password fields do not match!';
  String get errorMsg5 => 'Invalid Name!';
  String get errorMsg6 => 'Invalid College!';
  String get errorMsg7 => 'Invalid Department!';
  // String get errorMsg5 => '';
  // String get errorMsg6 => '';
  // String get errorMsg7 => '';

  @override
  void setFormStatus() {}

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  String? validator(
      {String? data, FieldType? type, String? password1, int? value}) {
    if (type == FieldType.EMAIL) {
      //validate for email
      if (data == null || (!data.contains('@')) || (!data.contains('.'))) {
        return errorMsg1;
      }
    }
    if (type == FieldType.PASSWORD1) {
      //validate for password
      if (data == null || data.length < 2) {
        return errorMsg3;
      }
    }

    if (type == FieldType.PASSWORD2) {
      if (data != password1 || password1 == null) {
        return errorMsg4;
      }
    }

    if (type == FieldType.NAME) {
      if (data == null || data.trim().length < 2) {
        return errorMsg5;
      }
    }

    if (type == FieldType.COLLEGE) {
      if (data == null) {
        return errorMsg6;
      }
    }

    if (type == FieldType.DEPARTMENT) {
      if (data == null) {
        return errorMsg7;
      }
    }
    return null;
  }
}

enum FieldType { NAME, EMAIL, PASSWORD1, PASSWORD2, COLLEGE, DEPARTMENT }
