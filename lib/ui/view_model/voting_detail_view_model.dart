import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/services/voting_services.dart';

class VotingDetailViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _votingServices = locator<VotingServices>();

  void goBack() => _navigator.back();

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
}
