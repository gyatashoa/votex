import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/UserDetails_model.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/firestore_services.dart';
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
  DialogService _dialogService = locator<DialogService>();
  AuthServices _authService = locator<AuthServices>();
  FirestoreServices _firestoreServices = locator<FirestoreServices>();

  void forgotPassword() {}
  void signIn() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      var result =
          await _authService.signIn(data['email']!, data['password1']!);
      var userdetails = await _firestoreServices.getUserDetails(UserDetails);
      setBusy(false);
      if (result is bool) {
        if (result) {
          _navigationService.replaceWith(Routes.homeView);
        } else {
          await _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'General sign up failure. Please try again later',
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: result.message,
        );
      }
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
