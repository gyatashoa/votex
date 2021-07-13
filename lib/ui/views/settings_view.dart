import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/providers/user_details_provider.dart';
import 'package:votex/ui/view_model/settings_view_model.dart';

// ignore: must_be_immutable
class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  List<Map<String, dynamic>> _tiles = [
    {
      'title': 'Profile',
      'icon': Icons.person_pin,
      'navigateTo': PageToNavigateTo.PROFILE
    },
    {
      'title': 'About This App',
      'icon': Icons.mobile_friendly,
      'navigateTo': PageToNavigateTo.ABOUT_APP
    },
    {
      'title': 'Terms And Conditions',
      'icon': Icons.insert_drive_file_outlined,
      'navigateTo': PageToNavigateTo.TERMS
    },
    {
      'title': 'Sign Out',
      'icon': Icons.logout,
      'navigateTo': PageToNavigateTo.SIGN_OUT
    },
  ];

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<SettingsViewModel>.nonReactive(
        builder: (ctx, model, widget) {
          return Container(
              padding: EdgeInsets.only(top: 10),
              color: Theme.of(context).scaffoldBackgroundColor,
              height: devSize.height,
              child: ListView.separated(
                  itemBuilder: (ctx, i) =>
                      Consumer<UserDetailsProvider>(builder: (_, provider, __) {
                        return ListTile(
                          enableFeedback: true,
                          onTap: () => model.onTileTapped(
                              this._tiles[i]['navigateTo'], provider),
                          title: Text(this._tiles[i]['title']),
                          trailing: Icon(this._tiles[i]['icon']),
                        );
                      }),
                  separatorBuilder: (ctx, i) => Divider(),
                  itemCount: this._tiles.length));
        },
        viewModelBuilder: () => SettingsViewModel());
  }
}

enum PageToNavigateTo { PROFILE, ABOUT_APP, TERMS, SIGN_OUT }
