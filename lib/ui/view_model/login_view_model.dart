import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';

class LoginViewModel extends MainFormModel {
  String headLine = 'Hello \nThere';
  String emailHintext = 'Email';
  String passwordHintext = 'Password';
  String forgotPasswordTxt = 'forgot Password?';
  String signText = 'Sign In';
  String needAccTxt = 'Need an account to vote?';
  String registerText = 'register';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  Map<String, String> data = {
    'email': '',
    'password1': '',
  };

  NavigationService _navigationService = locator<NavigationService>();

  void forgotPassword() {}
  void signIn() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(Duration(seconds: 3));
      setBusy(false);
      _navigationService.replaceWith(Routes.homeView);
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

  void navigateToCreateAccount() {
    _navigationService.navigateTo(Routes.signUpView);
  }
}
