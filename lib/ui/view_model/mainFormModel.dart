import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class MainFormModel extends FormViewModel {
  String get errorMsg1 => 'Invalid email!';
  String get errorMsg2 => 'length too short!';
  String get errorMsg3 => 'Length should be greater than 5!';
  String get errorMsg4 => 'Password fields do not match!';
  String get errorMsg5 => 'Invalid school id!';
  // String get errorMsg5 => '';
  // String get errorMsg6 => '';
  // String get errorMsg7 => '';

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  String? validator({String? data, FieldType? type, String? password1}) {
    if (type == FieldType.EMAIL) {
      //validate for email
      if (data == null || data.length < 6) {
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

    if (type == FieldType.SCHOOLID) {
      if (data == null || data.length < 5) {
        return errorMsg5;
      }
    }
    return null;
  }
}

enum FieldType { EMAIL, PASSWORD1, PASSWORD2, SCHOOLID, COLLEGE, DEPARTMENT }
