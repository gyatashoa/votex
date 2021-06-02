import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends FutureViewModel {
  final hintText = 'Type here...';
  final TextEditingController searchController =
      TextEditingController(text: '');
  @override
  Future<void> futureToRun() async {
    // TODO: implement futureToRun
  }

  void onValueChanged(String val) {
    notifyListeners();
  }

  void performSearch() {}

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
