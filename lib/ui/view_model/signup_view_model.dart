import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';

class SignUpViewModel extends MainFormModel {
  String headLine = 'Create \nAccount ';
  String emailHintext = 'Email';
  String passwordHintext = 'Password';
  String confirmPasswordHintext = 'Confirm Password';
  String signText = 'Sign Up';
  String alreadyHaveAnAcc = 'Already Have an account?';
  String registerText = 'sign in';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  Map<String, String> data = {
    'email': '',
    'password1': '',
    'password2': '',
  };

  void onFieldChange({String? data, FieldType? type}) {
    if (type == FieldType.EMAIL) {
      this.data = {...this.data, 'email': data!};
      return;
    }
    if (type == FieldType.PASSWORD1) {
      this.data = {...this.data, 'password1': data!};
      return;
    }
    if (type == FieldType.PASSWORD2) {
      this.data = {...this.data, 'password2': data!};
      return;
    }
  }

  NavigationService _navigationService = locator<NavigationService>();

  void navigateToSignIn() {
    _navigationService.popRepeated(1);
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(Duration(seconds: 3));
      setBusy(false);
      _navigationService.pushNamedAndRemoveUntil(
          Routes.completeRegistrationView,
          predicate: (route) => false);
    }
  }
}
