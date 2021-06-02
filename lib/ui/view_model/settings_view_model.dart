import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  String get title => 'Settings';

  bool _theme = false;
  bool _alert = false;
  bool get getTheme => this._theme;
  bool get getAlert => this._alert;

  void onThemeChanged(bool val) {
    this._theme = val;
    notifyListeners();
  }

  void onAlertChanged() {
    this._alert = !this._alert;
    notifyListeners();
  }
}
