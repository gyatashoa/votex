import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/utils/dateutils.dart';

class ProfileViewModel extends BaseViewModel {
  final scrollController = ScrollController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final collegeController = TextEditingController();
  final departmentController = TextEditingController();
  final fullNameController = TextEditingController();
  final _authSevices = locator<AuthServices>();

  final schoolIdText = 'School Id';
  final fullNameText = 'Full Name';
  final emailText = 'Email';
  final dateText = 'Date of Birth';
  final collegeText = 'College';
  final departmentText = 'Department';
  void init(ProfileViewModel model, UserDetailsProvider provider) {
    idController.text = this._authSevices.currentUser!.uid;
    emailController.text = this._authSevices.currentUser!.email!;
    dateController.text = DateUtil.formatDate(provider.userDetails.dob!);
    collegeController.text = provider.userDetails.collegeName!;
    departmentController.text = provider.userDetails.departmentName!;
    fullNameController.text = this._authSevices.currentUser!.displayName!;
  }
}
