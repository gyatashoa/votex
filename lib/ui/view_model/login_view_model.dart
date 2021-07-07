import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/UserDetails_model.dart';
import 'package:votex/models/hiveUserDetails_model.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/firestore_services.dart';
import 'package:votex/services/local_caching_services.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:votex/utils/firestore_helpers.dart';

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
  LocalCachingSevices _cachingSevices = locator<LocalCachingSevices>();

  void forgotPassword() {}
  void signIn(UserDetailsProvider provider) async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      var result =
          await _authService.signIn(data['email']!, data['password1']!);

      //get details from firebase
      HiveUserDetails user = await FirestoreHelpers.getHiveUserDetails();

      //cache details
      await _cachingSevices.cacheUserDetails(user);

      //set user details store
      provider.userDetails = user;

      setBusy(false);
      if (result is bool) {
        if (result) {
          if (user == null) {
            //redirect user to complete registration view
            await _navigationService
                .replaceWith(Routes.completeRegistrationView);
            return;
          }
          await _navigationService.replaceWith(Routes.homeView);
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
