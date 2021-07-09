import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/models/voting_model.dart';

class VotingDetailViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final dialogService = locator<DialogService>();

  void goBack() => _navigator.back();

  void onVotePressed(VotingDataModel model) async {
    var response = await dialogService.showConfirmationDialog(
      title: 'Are you sure you want to vote?',
    );
    if (response!.confirmed) {
      _navigator.navigateTo(Routes.votingView,
          arguments: VotingViewArguments(dataModel: model));
      return;
    }
  }
}
