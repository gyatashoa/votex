import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';

class CompleteRegistrationViewModel extends MainFormModel {
  String headLine = 'Finish \nRegistration ';
  String schoolId = 'School Id';
  String collegeTxt = 'College of Affiliation';
  String departmentTxt = 'Department';
  String signText = 'Submit';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController schoolIdController = TextEditingController();
  Map<String, dynamic> data = {
    'schoolId': '',
    'college': 0,
    'department': 0,
  };

  List<DropdownMenuItem<int>> colleges = [
    DropdownMenuItem(value: 0, child: Text('College of Science')),
    DropdownMenuItem(value: 1, child: Text('Arts')),
    DropdownMenuItem(value: 2, child: Text('Health')),
  ];
  List<DropdownMenuItem<int>> departments = [
    DropdownMenuItem(value: 0, child: Text('Computer Science')),
    DropdownMenuItem(value: 1, child: Text('Biological Science')),
    DropdownMenuItem(value: 2, child: Text('Physics')),
  ];

  NavigationService _navigationService = locator<NavigationService>();

  void submit() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(Duration(seconds: 3));
      setBusy(false);
    }
  }

  void onFieldChange({String? data, FieldType? type}) {
    if (type == FieldType.EMAIL) {
      this.data = {...this.data, 'email': data!};
      return;
    }
    if (type == FieldType.PASSWORD1) {
      this.data = {...this.data, 'password1': data!};
      return;
    }
  }

  void navigateToHome() {}

  void onDropChanged({int? data, FieldType? type}) {
    if (type == FieldType.COLLEGE) {
      this.data = {...this.data, 'college': data};
    }
    if (type == FieldType.DEPARTMENT) {
      this.data = {...this.data, 'department': data};
    }
    notifyListeners();
  }
}
