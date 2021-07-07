import 'package:hive/hive.dart';

part 'hiveUserDetails_model.g.dart';

@HiveType(typeId: 0)
class HiveUserDetails extends HiveObject {
  @HiveField(0)
  String? departmentName;

  @HiveField(1)
  String? departmentId;

  @HiveField(2)
  String? collegeId;

  @HiveField(3)
  String? collegeName;

  @HiveField(4)
  DateTime? dob;
}
