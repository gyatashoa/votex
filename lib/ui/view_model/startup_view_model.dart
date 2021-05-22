import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  void init(StartUpViewModel model) async {
    //load stuffs that needs to be loaded
    //TODO
    await Future.delayed(Duration(seconds: 2));
    _navigationService.replaceWith(Routes.loginView);
  }
}
