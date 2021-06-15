class UserDetails {
  final String id;
  final String collegeId;
  final String departmentId;
  final DateTime dob;

  UserDetails(this.id, this.collegeId, this.departmentId, this.dob);

  UserDetails.fromJson(Map<String, dynamic> data)
      : this.id = data['id']!,
        this.collegeId = data['collegeId']!,
        this.departmentId = data['departmentId'],
        this.dob = DateTime.fromMillisecondsSinceEpoch((data['dob']));

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'collegeId': this.collegeId,
        'departmentId': this.departmentId,
        'dob': this.dob.millisecondsSinceEpoch
      };
}
