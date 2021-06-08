import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/ui/views/settings_view.dart';

class SettingsViewModel extends BaseViewModel {
  String get title => 'Settings';
  final _navigator = locator<NavigationService>();
  final _authServices = locator<AuthServices>();

  void onTileTapped(PageToNavigateTo page, ctx) async {
    switch (page) {
      case PageToNavigateTo.PROFILE:
        _navigator.navigateTo(Routes.profileView);
        break;
      case PageToNavigateTo.ABOUT_APP:
        break;
      case PageToNavigateTo.TERMS:
        break;
      case PageToNavigateTo.SIGN_OUT:
        await this._authServices.signOut();
        _navigator.replaceWith(Routes.loginView);
        break;
      default:
    }
  }
}
