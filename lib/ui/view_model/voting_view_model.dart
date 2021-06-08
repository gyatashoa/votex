import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/voting_model.dart';
import 'package:votex/utils/setup_bottom_sheet.dart';

class VotingViewModel extends BaseViewModel {
  List<Map<String, bool>> votingState = [];
  final _navigator = locator<NavigationService>();
  final _bottomSheet = locator<BottomSheetService>();
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

  void onSubmit() async {
    var res =
        await _bottomSheet.showCustomSheet(variant: BottomSheetType.floating);
    // print(res!.responseData);
  }
}
