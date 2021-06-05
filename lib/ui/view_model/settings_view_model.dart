import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/ui/views/settings_view.dart';

class SettingsViewModel extends BaseViewModel {
  String get title => 'Settings';
  final navigator = locator<NavigationService>();

  void onTileTapped(PageToNavigateTo page, ctx) {
    switch (page) {
      case PageToNavigateTo.PROFILE:
        navigator.navigateTo(Routes.profileView);
        break;
      case PageToNavigateTo.ABOUT_APP:
        break;
      case PageToNavigateTo.TERMS:
        break;
      case PageToNavigateTo.SIGN_OUT:
        break;
      default:
    }
  }
}
