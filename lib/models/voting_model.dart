import 'package:flutter/cupertino.dart';

class VotingModel {
  final String pollTitle;
  final PollStatus status;
  final List<String> contestants;
  final List<Color>? tags;
  final List<double> values;

  const VotingModel(this.pollTitle, this.status, this.contestants, this.values,
      {this.tags});
}

enum PollStatus { ONGOING, COMPLETED, NOTSTARTED }
