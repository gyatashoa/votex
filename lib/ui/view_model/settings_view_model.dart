import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/providers/recent_voting_searches_provider.dart';
import 'package:votex/providers/subscriptions_provider.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/services/auth_services.dart';
import 'package:votex/services/local_caching_services.dart';
import 'package:votex/ui/views/settings_view.dart';

class SettingsViewModel extends BaseViewModel {
  String get title => 'Settings';
  final _navigator = locator<NavigationService>();
  final _authServices = locator<AuthServices>();
  final _localCachingServices = locator<LocalCachingSevices>();

  void onTileTapped(
      BuildContext context,
      PageToNavigateTo page,
      UserDetailsProvider provider,
      RecentVotingSearchesProvider recentProvider,
      SubscriptionsProvider subscriptionsProvider) async {
    switch (page) {
      case PageToNavigateTo.PROFILE:
        _navigator.navigateTo(Routes.profileView,
            arguments: ProfileViewArguments(isContestant: false));
        break;
      case PageToNavigateTo.ABOUT_APP:
        showAboutDialog(
            context: context,
            applicationIcon: Container(
                child: Image.asset(
              'assets/icon/icon.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            )),
            applicationVersion: '1.0.0',
            applicationName: 'Votex');
        break;
      case PageToNavigateTo.SIGN_OUT:
        recentProvider.emptyRecent();
        subscriptionsProvider.emptySubscription();
        await this._authServices.signOut();
        await _localCachingServices.removecachedUserDetails();
        await _navigator.replaceWith(Routes.loginView);
        break;
      default:
    }
  }
}
