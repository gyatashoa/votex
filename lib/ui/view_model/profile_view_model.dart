import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final scrollController = ScrollController();
  final idController = TextEditingController(text: '4545455454564');
  final emailController = TextEditingController(text: 'someone@gmail.com');
  final dateController = TextEditingController(text: '21/10/1999');
  final collegeController = TextEditingController(text: 'College of Science');
  final departmentController = TextEditingController(text: 'Computer Science');
  final fullNameController =
      TextEditingController(text: 'Asamoah Yeboah Felix');

  final schoolIdText = 'School Id';
  final fullNameText = 'Full Name';
  final emailText = 'Email';
  final dateText = 'Date of Birth';
  final collegeText = 'College';
  final departmentText = 'Department';
  void init(ProfileViewModel model) {}
}
