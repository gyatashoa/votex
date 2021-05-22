import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/ui/views/complete_registration_view.dart';
import 'package:votex/ui/views/login_view.dart';
import 'package:votex/ui/views/signup_view.dart';
import 'package:votex/ui/views/startup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: CompleteRegistrationView),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
