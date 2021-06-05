// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/complete_registration_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/profile_view.dart';
import '../ui/views/signup_view.dart';
import '../ui/views/startup_view.dart';

class Routes {
  static const String startUpView = '/start-up-view';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String completeRegistrationView = '/complete-registration-view';
  static const String homeView = '/';
  static const String profileView = '/profile-view';
  static const all = <String>{
    startUpView,
    loginView,
    signUpView,
    completeRegistrationView,
    homeView,
    profileView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.completeRegistrationView, page: CompleteRegistrationView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.profileView, page: ProfileView),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
  };
}
