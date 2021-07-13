import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/services/notification_services.dart';
import 'package:votex/services/voting_services.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';

class VotingDetailViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _votingServices = locator<VotingServices>();
  final _notificationServices = locator<NotificationServices>();
  final _snackBar = locator<SnackbarService>();

  void goBack() => _navigator.back();

  VotingDataModel convertData(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return VotingDataModel.fromJson({...snapshot.data()!, "id": snapshot.id});
  }

  void onVotePressed(VotingDataModel model, BuildContext context) async {
    var status = _votingServices.canVote(model, context);

    if (!status!.status) {
      await _dialogService.showDialog(
          title: "Particpation Error", description: status.message);
      return;
    }

    var response = await _dialogService.showConfirmationDialog(
      title: 'Are you sure you want to vote?',
    );
    if (response!.confirmed) {
      _navigator.navigateTo(Routes.votingView,
          arguments: VotingViewArguments(dataModel: model));
      return;
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getVotingDataModel(
      Type t, String id) {
    final _instance = FirebaseFirestore.instance;
    return _instance.collection(t.toString()).doc(id).snapshots();
  }

  void navigateToAboutContestant(Contestant contestant) async {
    await _navigator.navigateTo(Routes.profileView,
        arguments:
            ProfileViewArguments(isContestant: true, contestant: contestant));
  }

  Future subscribe(VotingDataModel model, int id) async {
    await _notificationServices.subscribe(model, id);
    _snackBar.registerCustomSnackbarConfig(
        variant: "myvariant",
        config: SnackbarConfig(
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            snackStyle: SnackStyle.FLOATING,
            textColor: Colors.white));
    _snackBar.showCustomSnackBar(
        variant: "myvariant",
        duration: Duration(seconds: 5),
        message: "Added to subscriptions!");
  }

  Future unsubscribe(int id) async {
    await _notificationServices.unsubscribe(id);
    _snackBar.registerCustomSnackbarConfig(
        variant: "myvariant",
        config: SnackbarConfig(
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            snackStyle: SnackStyle.FLOATING,
            textColor: Colors.white));
    _snackBar.showCustomSnackBar(
        variant: "myvariant",
        duration: Duration(seconds: 5),
        message: "Removed from subscriptions!");
  }
}
