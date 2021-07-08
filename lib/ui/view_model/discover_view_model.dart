import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_model.dart';

class DiscoverViewModel extends StreamViewModel<List<VotingModel>> {
  String get title => 'Discover';
  final _navigator = locator<NavigationService>();

  void onInit(DiscoverViewModel model) async {
    setBusy(true);

    //mock data loading
    await new Timer(Duration(seconds: 5), () {
      setBusy(false);
    });
  }

  List<VotingModel> _list = [
    VotingModel('Src President', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      45,
      22,
      25,
      8
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
    VotingModel('Src Financial Secretary', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      35,
      22,
      25,
      18
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
    VotingModel('Src Vice President', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      25,
      22,
      25,
      28
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
    VotingModel('Src General Secretary', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      50,
      22,
      20,
      8
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
    VotingModel('Src General Secretary', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      50,
      22,
      20,
      8
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
    VotingModel('Src General Secretary', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      50,
      22,
      20,
      8
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
    VotingModel('Src General Secretary', PollStatus.ONGOING, <String>[
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah',
      'Micheal Abuah Yeboah'
    ], <double>[
      50,
      22,
      20,
      8
    ], tags: <Color>[
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.black
    ]),
  ];

  void navigateToDetail(VotingModel model) {
    this._navigator.navigateTo(Routes.votingDetailView,
        arguments: VotingDetailViewArguments(dataModel: model));
  }

  @override
  Stream<List<VotingModel>> get stream => Stream.value(_list);
}
