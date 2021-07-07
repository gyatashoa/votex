import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/date_services.dart';
import 'package:votex/services/firestore_services.dart';
import 'package:votex/services/local_caching_services.dart';
import 'package:votex/ui/views/complete_registration_view.dart';
import 'package:votex/ui/views/home_view.dart';
import 'package:votex/ui/views/login_view.dart';
import 'package:votex/ui/views/profile_view.dart';
import 'package:votex/ui/views/signup_view.dart';
import 'package:votex/ui/views/startup_view.dart';
import 'package:votex/ui/views/voting_detail_view.dart';
import 'package:votex/ui/views/voting_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(
    page: CompleteRegistrationView,
  ),
  MaterialRoute(
    page: HomeView,
  ),
  MaterialRoute(
    page: ProfileView,
  ),
  MaterialRoute(
    page: VotingDetailView,
  ),
  MaterialRoute(
    page: VotingView,
  ),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: AuthServices),
  LazySingleton(classType: DateServices),
  LazySingleton(classType: FirestoreServices),
  LazySingleton(classType: LocalCachingSevices)
])
class AppSetup {}
