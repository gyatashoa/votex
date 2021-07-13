import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';

class SearchViewModel extends FutureViewModel {
  final hintText = 'Type here...';
  final TextEditingController searchController =
      TextEditingController(text: '');

  final _navigator = locator<NavigationService>();
  @override
  Future<void> futureToRun() async {}

  void onValueChanged(String val) {
    notifyListeners();
  }

  void performSearch() {}

  void pop() {
    _navigator.popRepeated(1);
  }

  void navigateToVotingDetails(VotingDataModel dataModel) async {
    await _navigator.navigateTo(Routes.votingDetailView,
        arguments: VotingDetailViewArguments(dataModel: dataModel));
  }

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
