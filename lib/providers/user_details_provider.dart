import 'package:flutter/foundation.dart';
import 'package:votex/models/hiveUserDetails_model.dart';

class UserDetailsProvider with ChangeNotifier {
  late HiveUserDetails _userDetails;

  set userDetails(HiveUserDetails details) {
    this._userDetails = details;
    notifyListeners();
  }

  HiveUserDetails get hiveUserDetails => this._userDetails;
}
