import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/services/auth_services.dart';

class StartUpViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthServices _authServices = locator<AuthServices>();
  void init(StartUpViewModel model) async {
    var user = this._authServices.currentUser;
    if (user != null) {
      _navigationService.replaceWith(Routes.homeView);
      return;
    }
    _navigationService.replaceWith(Routes.loginView);
  }
}
