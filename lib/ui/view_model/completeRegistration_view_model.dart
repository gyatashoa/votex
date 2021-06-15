import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/UserDetails_model.dart';
import 'package:votex/models/college_model.dart';
import 'package:votex/models/department_model.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/date_services.dart';
import 'package:votex/services/firestore_services.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:votex/utils/dateutils.dart';

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
  TextEditingController dateController = TextEditingController();

  Map<String, dynamic> data = {
    'name': null,
    'schoolId': '',
    'collegeId': null,
    'departmentId': null,
    'dob': DateTime.now()
  };

  List<DropdownMenuItem<String>> colleges = [];
  List<Department> _deps = [];
  List<DropdownMenuItem<String>> departments = [];

  NavigationService _navigationService = locator<NavigationService>();
  DateServices _dateServices = locator<DateServices>();
  AuthServices _authServices = locator<AuthServices>();
  FirestoreServices _firestoreServices = locator<FirestoreServices>();
  DialogService _dialogService = locator<DialogService>();

  void submit() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      var cleanData = UserDetails(_authServices.currentUser!, data['collegeId'],
          data['departmentId'], data['dob']);
      var result =
          await _firestoreServices.uploadData(cleanData.toJson(), UserDetails);
      var result1 = await _authServices.UpdateName(data['name']);
      if (result == null) {
        print('gone through');
      } else {
        await _dialogService.showDialog(
          title: 'Error',
          description: result.message,
        );
      }
      setBusy(false);
      _navigationService.replaceWith(Routes.homeView);
    }
  }

  void onFieldChange({String? data, FieldType? type}) {
    if (type == FieldType.NAME) {
      this.data = {...this.data, 'name': data!};
      return;
    }
  }

  void navigateToHome() {}

  void onDropChanged({String? data, FieldType? type}) {
    if (type == FieldType.COLLEGE) {
      this.data = {...this.data, 'collegeId': data};
      _deps.forEach((element) {
        if (element.collegeId == data) {
          departments = [];
          departments.add(DropdownMenuItem<String>(
            child: Text(element.name),
            value: element.id,
          ));
        }
      });
    }
    if (type == FieldType.DEPARTMENT) {
      this.data = {...this.data, 'departmentId': data};
    }
    notifyListeners();
  }

  void onChangeDatePressed(BuildContext ctx) async {
    var value = await _dateServices.showDateDialog(ctx, data['dob']!);
    data['dob'] = value ?? data['dob'];
    dateController.text = DateUtil.formatDate(data['dob']);
    notifyListeners();
  }

  void onInit() async {
    schoolIdController.text = _authServices.currentUser!.uid;
    dateController.text = DateUtil.formatDate(data['dob']);
    data['name'] = _authServices.currentUser!.displayName;
    var res = await _firestoreServices.getColleges();
    if (res is List<College>) {
      colleges = res
          .map(
              (e) => DropdownMenuItem<String>(value: e.id, child: Text(e.name)))
          .toList();
    } else {
      print(res);
    }
    var res1 = await _firestoreServices.getDepartments();
    if (res1 is List<Department>) {
      _deps = res1;
    } else {
      print(res1);
    }
  }
}
