import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/date_services.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';

class CompleteRegistrationViewModel extends MainFormModel {
  String headLine = 'Finish \nRegistration ';
  String schoolId = 'School Id';
  String name = 'Full Name';
  String collegeTxt = 'College of Affiliation';
  String departmentTxt = 'Department';
  String signText = 'Submit';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController schoolIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Map<String, dynamic> data = {
    'name': null,
    'schoolId': '',
    'collegeId': null,
    'departmentId': null,
    'dob': DateTime.now()
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
  DateServices _dateServices = locator<DateServices>();
  AuthServices _authServices = locator<AuthServices>();
  void submit() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(Duration(seconds: 3));
      setBusy(false);
      // _navigationService.replaceWith(Routes.homeView);
    }
  }

  void onFieldChange({String? data, FieldType? type}) {
    if (type == FieldType.NAME) {
      this.data = {...this.data, 'name': data!};
      return;
    }
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
      this.data = {...this.data, 'collegeId': data};
    }
    if (type == FieldType.DEPARTMENT) {
      this.data = {...this.data, 'departmentId': data};
    }
    notifyListeners();
  }

  void onDateSaved(DateTime date) {
    print(date.toString());
  }

  void onDateSubmitted(DateTime date) {
    print(date);
  }

  void onChangeDatePressed(BuildContext ctx) async {
    var value = await _dateServices.showDateDialog(ctx, data['dob']!);
    data['dob'] = value ?? data['dob'];
    notifyListeners();
  }

  void onInit() {
    schoolIdController.text = _authServices.currentUser!.uid;
  }
}
