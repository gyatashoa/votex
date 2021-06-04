import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/ui/view_model/home_view_model.dart';
import 'package:votex/ui/views/discover_view.dart';
import 'package:votex/ui/views/profile_view.dart';
import 'package:votex/ui/views/search_view.dart';
import 'package:votex/ui/views/settings_view.dart';
import 'package:votex/ui/widgets/custom_bottom_nav_bar.dart';

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

  final List<Widget> _tabs = <Widget>[
    DiscoverView(),
    SearchView(),
    Container(),
    SettingsView(),
    ProfileView(),
  ];

  _MobileView(
    this.info,
    this.model, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size devSize = this.info.screenSize;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: this._tabs[model.currentIndex],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: devSize.width * .11,
                left: devSize.width * .11,
                bottom: devSize.height * .1),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomNavBar(
                  model: model,
                  info: info,
                )),
          ),
        ],
      ),
    ));
  }
}
