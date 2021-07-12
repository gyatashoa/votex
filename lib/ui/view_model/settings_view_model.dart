import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/local_caching_services.dart';
import 'package:votex/ui/views/settings_view.dart';

class SettingsViewModel extends BaseViewModel {
  String get title => 'Settings';
  final _navigator = locator<NavigationService>();
  final _authServices = locator<AuthServices>();
  final _localCachingServices = locator<LocalCachingSevices>();

  void onTileTapped(PageToNavigateTo page, UserDetailsProvider provider) async {
    switch (page) {
      case PageToNavigateTo.PROFILE:
        _navigator.navigateTo(Routes.profileView,
            arguments: ProfileViewArguments(isContestant: false));
        break;
      case PageToNavigateTo.ABOUT_APP:
        break;
      case PageToNavigateTo.TERMS:
        break;
      case PageToNavigateTo.SIGN_OUT:
        await this._authServices.signOut();
        await _localCachingServices.removecachedUserDetails();
        await _navigator.replaceWith(Routes.loginView);
        break;
      default:
    }
  }
}
