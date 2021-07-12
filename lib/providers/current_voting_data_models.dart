import 'package:flutter/foundation.dart';
import 'package:votex/models/voting_data_model.dart';

class CurrentVotingDataModelProvider with ChangeNotifier {
  late List<VotingDataModel> _currentVotingDataModels;

  CurrentVotingDataModelProvider() {
    this._currentVotingDataModels = [];
  }

  set currentVotingDataModel(List<VotingDataModel> data) {
    this._currentVotingDataModels = data;
  }

  List<VotingDataModel> get currentVotingDataModel =>
      this._currentVotingDataModels;
}
