// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/auth_services.dart';
import '../services/date_services.dart';
import '../services/firestore_services.dart';
import '../services/local_caching_services.dart';
import '../services/notification_services.dart';
import '../services/voting_services.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => AuthServices());
  locator.registerLazySingleton(() => DateServices());
  locator.registerLazySingleton(() => FirestoreServices());
  locator.registerLazySingleton(() => LocalCachingSevices());
  locator.registerLazySingleton(() => VotingServices());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => NotificationServices());
}
