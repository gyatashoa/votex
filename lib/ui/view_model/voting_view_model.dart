import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/voting_model.dart';

class VotingViewModel extends BaseViewModel {
  List<Map<String, bool>> votingState = [];
  final _navigator = locator<NavigationService>();
  final submitText = 'Submit';
  final resetText = 'Reset';
  int state = -1;
  bool group = true;
  void onInit(VotingModel model) {
    model.contestants.asMap().entries.forEach((element) {
      votingState.add({element.value: false});
    });
  }

  void onTileTapped(bool val, int key, String name) {
    print('element.value[name]');
    votingState.asMap().entries.forEach((element) {
      if (element.key == key) {
        element.value[name] = !val;
      }
    });
    notifyListeners();
  }

  void change(int val) {
    if (val == state) {
      val = -1;
    } else {
      state = val;
    }
    notifyListeners();
  }

  void goBack() {
    _navigator.back();
  }

  void onSubmit() {}
  void onReset() {}
}
