import 'package:flutter/foundation.dart';

class VotingDataModel {
  String? title;
  VotingType? type;
  int? year;
  DateTime? startTime;
  DateTime? endTime;
  List<Contestant>? contestants;

  VotingDataModel({
    @required this.title,
    @required this.type,
    @required this.year,
    @required this.startTime,
    @required this.contestants,
    @required this.endTime,
  });

  VotingDataModel.fromJson(Map<String, dynamic> data)
      : this.title = data["title"],
        this.type = data["type"] == 1
            ? VotingType.SRC
            : (data["type"] == 2 ? VotingType.COLLEGE : VotingType.DEPARTMENT),
        this.year = data["year"],
        this.startTime = data["startTime"].toDate(),
        this.endTime = data["endTime"].toDate(),
        this.contestants = data["contestants"]
            .map((e) => Contestant.fromJson(e))
            .toList()
            .cast<Contestant>();

  @override
  String toString() {
    return "VotingDataModel";
  }
}

class Contestant {
  String? name;
  String? imagePath;
  List<String>? votes;
  String? college;
  String? department;
  String? hall;
  int? year;

  Contestant(
      {@required this.name,
      this.imagePath,
      @required this.votes,
      @required this.college,
      @required this.department,
      @required this.hall,
      @required this.year});

  Contestant.fromJson(Map<String, dynamic> data)
      : this.name = data["name"],
        this.imagePath = data["imagePath"],
        this.votes = data["votes"].cast<String>(),
        this.college = data["college"],
        this.department = data["department"],
        this.hall = data["hall"],
        this.year = data["year"];
}

enum VotingType { SRC, COLLEGE, DEPARTMENT }
