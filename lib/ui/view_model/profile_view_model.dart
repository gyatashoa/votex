import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/voting_data_model.dart';
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
  final hallOfAffiliation = TextEditingController();
  final _authSevices = locator<AuthServices>();

  final schoolIdText = 'School Id';
  final fullNameText = 'Full Name';
  final emailText = 'Email';
  final hallText = 'Hall Of Affiliation';
  final dateText = 'Date of Birth';
  final collegeText = 'College';
  final departmentText = 'Department';
  void init(ProfileViewModel model, UserDetailsProvider provider,
      {bool isContestant = false, Contestant? contestant}) {
    idController.text = this._authSevices.currentUser!.uid;
    hallOfAffiliation.text = contestant == null ? '' : contestant.hall!;
    emailController.text = this._authSevices.currentUser!.email!;
    dateController.text = DateUtil.formatDate(provider.userDetails.dob!);
    collegeController.text = contestant == null
        ? provider.userDetails.collegeName!
        : contestant.college!;
    departmentController.text = contestant == null
        ? provider.userDetails.departmentName!
        : contestant.department!;
    fullNameController.text = contestant == null
        ? this._authSevices.currentUser!.displayName!
        : contestant.name!;
  }
}
