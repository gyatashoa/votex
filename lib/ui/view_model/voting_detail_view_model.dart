import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';

class VotingDetailViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  void goBack() => _navigator.back();

  void onVotePressed() {}
}
