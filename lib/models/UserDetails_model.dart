import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  final User user;
  final String collegeId;
  final String departmentId;
  final DateTime dob;

  UserDetails(this.user, this.collegeId, this.departmentId, this.dob);

  UserDetails.fromJson(Map<String, dynamic> data)
      : this.user = data['id']!,
        this.collegeId = data['collegeId']!,
        this.departmentId = data['departmentId'],
        this.dob = DateTime.fromMillisecondsSinceEpoch((data['dob']));

  Map<String, dynamic> toJson() => {
        'id': this.user.uid,
        'collegeId': this.collegeId,
        'departmentId': this.departmentId,
        'dob': this.dob.millisecondsSinceEpoch
      };

  @override
  String toString() {
    return 'UserDetails';
  }
}
