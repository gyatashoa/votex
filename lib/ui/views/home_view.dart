import 'package:animations/animations.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/ui/view_model/home_view_model.dart';
import 'package:votex/ui/views/discover_view.dart';
import 'package:votex/ui/views/search_view.dart';
import 'package:votex/ui/views/settings_view.dart';
import 'package:votex/ui/views/subscription_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, widget) {
          return ResponsiveBuilder(builder: (context, info) {
            if (info.isMobile) {
              return _MobileView(info, model);
            }
            //build default
            return _MobileView(info, model);
          });
        },
        viewModelBuilder: () => HomeViewModel());
  }
}

class _MobileView extends StatelessWidget {
  final SizingInformation info;
  final HomeViewModel model;

  _MobileView(
    this.info,
    this.model, {
    Key? key,
  }) : super(key: key);

  final List<Widget> _tabViews = <Widget>[
    DiscoverView(),
    SearchView(),
    SubscriptionsView(),
    SettingsView(),
  ];

  final List<TabData> _tabs = <TabData>[
    TabData(iconData: Icons.explore_outlined, title: 'Discover'),
    TabData(iconData: Icons.search, title: 'Search'),
    TabData(iconData: Icons.notifications_active, title: 'Subscriptions'),
    TabData(iconData: Icons.settings_outlined, title: 'Settings'),
    // TabData(iconData: Icons.person_pin, title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
                child: child,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation);
          },
          child: this._tabViews[this.model.currentIndex]),
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: this.model.currentIndex,
        onTabChangedListener: this.model.setIndex,
        tabs: _tabs,
      ),
    );
  }
}
