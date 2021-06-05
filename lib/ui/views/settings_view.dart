import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/ui/view_model/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  List<Map<String, dynamic>> _tiles = [
    {
      'title': 'About This App',
      'icon': Icons.mobile_friendly,
    },
    {
      'title': 'Terms And Conditions',
      'icon': Icons.insert_drive_file_outlined,
    },
    {
      'title': 'Sign Out',
      'icon': Icons.logout,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<SettingsViewModel>.reactive(
        builder: (ctx, model, widget) {
          return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: devSize.height,
              child: Column(
                children: [
                  AppBar(
                      centerTitle: true,
                      title: Text(
                        model.title,
                        style: Theme.of(context).appBarTheme.titleTextStyle,
                      )),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (ctx, i) => ListTile(
                              title: Text(this._tiles[i]['title']),
                              trailing: Icon(this._tiles[i]['icon']),
                            ),
                        separatorBuilder: (ctx, i) => Divider(),
                        itemCount: this._tiles.length),
                  ),
                ],
              ));
        },
        viewModelBuilder: () => SettingsViewModel());
  }
}
