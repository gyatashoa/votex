import 'package:flutter/foundation.dart';
import 'package:votex/models/voting_data_model.dart';

class SubscriptionsProvider with ChangeNotifier {
  late List<VotingDataModel> _subs;

  SubscriptionsProvider() {
    this._subs = [];
  }

  set subscriptions(VotingDataModel data) {
    this._subs.add(data);
    notifyListeners();
  }

  void removeSubscription(VotingDataModel data) {
    this._subs.removeWhere((element) => element.id == data.id);
    notifyListeners();
  }

  void emptySubscription() {
    this._subs = [];
    notifyListeners();
  }

  int getIdInNumbers(VotingDataModel model) {
    for (int i = 0; i < this._subs.length; i++) {
      if (model.id == this._subs[i].id) return i;
    }
    return -1;
  }

  List<VotingDataModel> get getSubscriptions => this._subs;
}
