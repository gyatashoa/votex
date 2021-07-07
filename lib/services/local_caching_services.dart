import 'package:hive/hive.dart';
import 'package:votex/models/hiveUserDetails_model.dart';

class LocalCachingSevices {
  LocalCachingSevices();

  String get boxName => "user_details";
  String get key => "user";

  Future cacheUserDetails(HiveUserDetails details) async {
    var box = await Hive.openBox<HiveUserDetails>(this.boxName);
    box.put(key, details);
    box.close();
  }

  Future removecachedUserDetails() async {
    var box = await Hive.openBox<HiveUserDetails>(this.boxName);
    box.delete(this.key);
    box.close();
  }

  Future<HiveUserDetails?> getcachedUserDetails() async {
    var box = await Hive.openBox<HiveUserDetails>(this.boxName);
    var data = box.get(this.key);
    box.close();
    return data;
  }
}
