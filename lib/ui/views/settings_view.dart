import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/ui/view_model/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        builder: (ctx, model, widget) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.headline1,
                ),
                ListTile(
                  title: Text('Dark Mode'),
                  trailing: Switch(
                      activeColor: primaryGreenColor,
                      value: model.getTheme,
                      onChanged: model.onThemeChanged),
                ),
                ListTile(
                  title: Text('Alerts'),
                  trailing: IconButton(
                      icon: Icon(Icons.alarm), onPressed: model.onAlertChanged),
                ),
                ListTile(
                    title: Text('About this App'),
                    trailing: Icon(Icons.mobile_friendly)),
                ListTile(
                    onTap: () {},
                    title: Text('Terms And Conditions'),
                    trailing: Icon(Icons.insert_drive_file_outlined)),
                ListTile(
                    onTap: () {},
                    title: Text('Sign Out'),
                    trailing: Icon(Icons.logout_rounded))
              ],
            ),
          );
        },
        viewModelBuilder: () => SettingsViewModel());
  }
}
