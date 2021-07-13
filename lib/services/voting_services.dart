import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/services/auth_services.dart';

class VotingServices {
  VotingServices();

  Future submitVote(
      VotingDataModel data, BuildContext context, int index) async {
    final instance = FirebaseFirestore.instance;
    final _authServices = locator<AuthServices>();

    //add vote to model
    data.contestants![index].votes!.add(_authServices.currentUser!.uid);

    try {
      //update votes in the cloud
      await instance
          .collection(data.toString())
          .doc(data.id)
          .update(data.toJson());
    } catch (e) {
      return e;
    }
  }

  VotingAllowed? canVote(VotingDataModel data, BuildContext context) {
    if (data.type == VotingType.SRC) {
      //Everyone can vote here

      //check if voter has already voted
      bool hasVoted = _hasAlreadyVoted(data);

      //check if poll hasEnded
      bool hasEnded = data.endTime!.isBefore(DateTime.now());

      //check if poll hasNot started
      bool hasNotStarted = data.startTime!.isAfter(DateTime.now());

      if (hasVoted) return VotingAllowed(false, 'Already Voted');
      if (hasEnded) return VotingAllowed(false, 'Poll has Ended');
      if (hasNotStarted) return VotingAllowed(false, 'Poll has not Started');
      return VotingAllowed(true, null);
    }

    if (data.type == VotingType.COLLEGE) {
      //check if voter can participate in this college
      bool canParticipate = _canVoteInThisCollege(data, context);

      //check if voter has already voted
      bool hasVoted = _hasAlreadyVoted(data);

      //check if poll hasEnded
      bool hasEnded = data.endTime!.isBefore(DateTime.now());

      //check if poll hasNot started
      bool hasNotStarted = data.startTime!.isAfter(DateTime.now());

      if (!canParticipate)
        return VotingAllowed(false, 'Can\'t participate in this college');
      if (hasVoted) return VotingAllowed(false, 'Already Voted');
      if (hasEnded) return VotingAllowed(false, 'Poll has Ended');
      if (hasNotStarted) return VotingAllowed(false, 'Poll has not started');
      return VotingAllowed(true, null);
    }
    if (data.type == VotingType.DEPARTMENT) {
      //check if voter can participate in this college
      bool canParticipate = _canVoteInThisDepartment(data, context);

      //check if voter has already voted
      bool hasVoted = _hasAlreadyVoted(data);

      //check if poll hasEnded
      bool hasEnded = data.endTime!.isBefore(DateTime.now());

      //check if poll hasNot started
      bool hasNotStarted = data.startTime!.isAfter(DateTime.now());

      if (!canParticipate)
        return VotingAllowed(false, 'Can\'t participate in this Department');
      if (hasVoted) return VotingAllowed(false, 'Already Voted');
      if (hasEnded) return VotingAllowed(false, 'Poll has Ended');
      if (hasNotStarted) return VotingAllowed(false, 'Poll has not started');
      return VotingAllowed(true, null);
    }
  }

  bool _canVoteInThisCollege(VotingDataModel data, BuildContext context) {
    UserDetailsProvider provider = Provider.of<UserDetailsProvider>(context);
    return data.collegeId == provider.userDetails.collegeId;
  }

  bool _canVoteInThisDepartment(VotingDataModel data, BuildContext context) {
    UserDetailsProvider provider = Provider.of<UserDetailsProvider>(context);
    return data.departmentId == provider.userDetails.departmentId;
  }

  bool _hasAlreadyVoted(VotingDataModel data) {
    final authServices = locator<AuthServices>();
    late bool hasVoted = false;
    data.contestants!.forEach((element) {
      element.votes!.forEach((element) {
        if (element == authServices.currentUser!.uid) hasVoted = true;
      });
    });
    return hasVoted;
  }
}

class VotingAllowed {
  final bool status;
  final String? message;

  VotingAllowed(this.status, this.message);
}
