import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/hiveUserDetails_model.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/local_caching_services.dart';

class StartUpViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthServices _authServices = locator<AuthServices>();
  LocalCachingSevices _localCachingSevices = locator<LocalCachingSevices>();

  void init(StartUpViewModel model, UserDetailsProvider provider) async {
    var user = this._authServices.currentUser;
    if (user != null) {
      var userDetails = await this._localCachingSevices.getcachedUserDetails();
      if (userDetails != null) {
        //set store here
        provider.userDetails = userDetails;
        //navigate to home route
        await _navigationService.replaceWith(Routes.homeView);
        return;
      }

      //means user needs to update his profile
      await _navigationService.replaceWith(Routes.completeRegistrationView);
      return;
    }
    await _navigationService.replaceWith(Routes.loginView);
  }
}
