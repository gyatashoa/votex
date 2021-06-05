import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/models/voting_model.dart';

class DiscoverViewModel extends StreamViewModel<List<VotingModel>> {
  String get title => 'Discover';

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

  @override
  Stream<List<VotingModel>> get stream => Stream.value(_list);
}
