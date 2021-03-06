import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/ui/view_model/mainFormModel.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final _authService = locator<AuthServices>();
  final _dialogService = locator<DialogService>();
  final _snackBarService = locator<SnackbarService>();
  final _navigator = locator<NavigationService>();

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void resetPassword() async {
    if (formkey.currentState!.validate()) {
      setBusy(true);
      var res = await _authService.resetPassword(this.emailController.text);
      setBusy(false);
      if (res != null) {
        _dialogService.showDialog(title: 'Error', description: res.message);
        return;
      }

      _snackBarService.registerCustomSnackbarConfig(
          variant: "myvariant",
          config: SnackbarConfig(
              borderRadius: 10,
              margin: const EdgeInsets.all(10),
              snackStyle: SnackStyle.FLOATING,
              textColor: Colors.white));
      _snackBarService.showCustomSnackBar(
          variant: "myvariant",
          duration: Duration(seconds: 8),
          title: 'Link Sent',
          message: 'A link was sent to you email');
      this.emailController.text = '';
    }
  }

  void goBack() {
    _navigator.back();
  }

  String? validate(String? val) {
    return MainFormModel().validator(data: val, type: FieldType.EMAIL);
  }
}
