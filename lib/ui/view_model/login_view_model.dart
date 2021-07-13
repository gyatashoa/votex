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
  FirestoreServices _firestoreServices = locator<FirestoreServices>();

  void forgotPassword() async {
    await _navigationService.navigateTo(Routes.resetPasswordView);
  }

  void signIn(UserDetailsProvider provider) async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      var result =
          await _authService.signIn(data['email']!, data['password1']!);

      if (result is bool) {
        if (result) {
          //get details from firebase
          var res = await _firestoreServices.getHiveUserDetails();

          if (res is HiveUserDetails) {
            //cached data
            await _cachingSevices.cacheUserDetails(res);

            //set to provider
            provider.userDetails = res;
            setBusy(false);
            await _navigationService.replaceWith(Routes.homeView);
          } else {
            setBusy(false);
            await _navigationService
                .replaceWith(Routes.completeRegistrationView);
          }
        } else {
          setBusy(false);
          await _dialogService.showDialog(
            title: 'Sign In Failure',
            description: 'General sign in failure. Please try again later',
          );
        }
      } else {
        setBusy(false);
        await _dialogService.showDialog(
          title: 'Sign In Failure',
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
