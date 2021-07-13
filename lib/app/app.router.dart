// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/voting_data_model.dart';
import '../ui/views/complete_registration_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/profile_view.dart';
import '../ui/views/reset_password_view.dart';
import '../ui/views/signup_view.dart';
import '../ui/views/startup_view.dart';
import '../ui/views/voting_detail_view.dart';
import '../ui/views/voting_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String completeRegistrationView = '/complete-registration-view';
  static const String homeView = '/home-view';
  static const String profileView = '/profile-view';
  static const String votingDetailView = '/voting-detail-view';
  static const String votingView = '/voting-view';
  static const all = <String>{
    startUpView,
    loginView,
    signUpView,
    resetPasswordView,
    completeRegistrationView,
    homeView,
    profileView,
    votingDetailView,
    votingView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.completeRegistrationView, page: CompleteRegistrationView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.votingDetailView, page: VotingDetailView),
    RouteDef(Routes.votingView, page: VotingView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ResetPasswordView(),
        settings: data,
      );
    },
    CompleteRegistrationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CompleteRegistrationView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      var args = data.getArgs<ProfileViewArguments>(
        orElse: () => ProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(
          key: args.key,
          isContestant: args.isContestant,
          contestant: args.contestant,
        ),
        settings: data,
      );
    },
    VotingDetailView: (data) {
      var args = data.getArgs<VotingDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VotingDetailView(
          args.id,
          key: args.key,
        ),
        settings: data,
      );
    },
    VotingView: (data) {
      var args = data.getArgs<VotingViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VotingView(
          args.dataModel,
          key: args.key,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProfileView arguments holder class
class ProfileViewArguments {
  final Key? key;
  final bool isContestant;
  final Contestant? contestant;
  ProfileViewArguments({this.key, this.isContestant = false, this.contestant});
}

/// VotingDetailView arguments holder class
class VotingDetailViewArguments {
  final String id;
  final Key? key;
  VotingDetailViewArguments({required this.id, this.key});
}

/// VotingView arguments holder class
class VotingViewArguments {
  final VotingDataModel dataModel;
  final Key? key;
  VotingViewArguments({required this.dataModel, this.key});
}
