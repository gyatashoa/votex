class Department {
  final String id;
  final String name;
  final String collegeId;

  Department.fromJson(Map<String, dynamic> data)
      : this.id = data['id']!,
        this.name = data['name']!,
        this.collegeId = data['collegeId']!;

  Map<String, String> toJson() =>
      {'id': this.id, 'name': this.name, 'collegeId': this.collegeId};

  @override
  String toString() {
    return 'Department';
  }
}
