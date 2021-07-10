import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/voting_services.dart';
import 'package:votex/utils/setup_bottom_sheet.dart';

class VotingViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _bottomSheet = locator<BottomSheetService>();
  final _dialog = locator<DialogService>();
  final _authServices = locator<AuthServices>();
  final _votingServices = locator<VotingServices>();
  final submitText = 'Submit';
  final resetText = 'Reset';
  int state = -1;
  bool group = true;
  void onInit(VotingDataModel data) {
    // data.contestants.asMap().entries.forEach((element) {
    //   votingState.add({element.value: false});
    // });
  }

  // void onTileTapped(bool val, int key, String name) {
  //   print('element.value[name]');
  //   votingState.asMap().entries.forEach((element) {
  //     if (element.key == key) {
  //       element.value[name] = !val;
  //     }
  //   });
  //   notifyListeners();
  // }

  void change(int val) {
    if (val == state) {
      state = -1;
    } else {
      state = val;
    }
    print(state);
    notifyListeners();
  }

  void goBack() {
    _navigator.back();
  }

  void onSubmit(VotingDataModel data, BuildContext context) async {
    if (this.state == -1) {
      //hasn't selected any candidate
      await _dialog.showDialog(
          title: 'Error', description: 'Please select a candidate to vote!');
      return;
    }
    var res =
        await _bottomSheet.showCustomSheet(variant: BottomSheetType.floating);
    //meaning user popped dialog by tapping other part of the ui
    if (res == null) return;

    //meaning user didnt type anything
    if (res.responseData == null) return;

    //reached here when user typed something
    //try validate user
    setBusy(true);
    var result = await _authServices.signIn(
        _authServices.currentUser!.email!, res.responseData);

    if (result is bool) {
      if (result) {
        //user typed the right password
        //try vote
        var err = await _votingServices.submitVote(data, context, state);
        setBusy(false);
        if (err != null)
          await _dialog.showDialog(title: 'Error', description: err.message);
      } else {
        setBusy(false);
        await _dialog.showDialog(
          title: 'Sign In Failure',
          description: 'General sign in failure. Please try again later',
        );
      }
    } else {
      setBusy(false);
      await _dialog.showDialog(
        title: 'Sign In Failure',
        description: result.message,
      );
    }
  }
}
