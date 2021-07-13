import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';

class DiscoverViewModel extends BaseViewModel {
  String get title => 'Discover';
  final _navigator = locator<NavigationService>();

  void navigateToDetail(VotingDataModel model) {
    this._navigator.navigateTo(Routes.votingDetailView,
        arguments: VotingDetailViewArguments(id: model.id!));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get stream =>
      getVotingDataModel(VotingDataModel);

  Stream<QuerySnapshot<Map<String, dynamic>>> getVotingDataModel(Type t) {
    final _instance = FirebaseFirestore.instance;
    return _instance.collection(t.toString()).snapshots();
  }

  List<VotingDataModel> convert(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    return data
        .map((e) => VotingDataModel.fromJson({...e.data(), "id": e.id}))
        .toList();
  }
}
