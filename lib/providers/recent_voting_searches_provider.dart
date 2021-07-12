import 'package:flutter/foundation.dart';
import 'package:votex/models/voting_data_model.dart';

class RecentVotingSearchesProvider with ChangeNotifier {
  late List<VotingDataModel> _recent;

  RecentVotingSearchesProvider() {
    this._recent = [];
  }

  set addRecentSearchesWithSingleData(VotingDataModel data) {
    final temp =
        this._recent.where((element) => element.id == data.id).toList();
    if (temp.isNotEmpty) return;
    if (temp.isEmpty) this._recent.add(data);
    notifyListeners();
  }

  List<VotingDataModel> get recentSearches => this._recent;
}
