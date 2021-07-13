import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';

class SubscriptionViewModel extends BaseViewModel {
  final _naviagtor = locator<NavigationService>();

  void navigateToVotingDetailsView(VotingDataModel dataModel) {
    _naviagtor.navigateTo(Routes.votingDetailView,
        arguments: VotingDetailViewArguments(id: dataModel.id!));
  }
}
