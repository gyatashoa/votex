class College {
  final String id;
  final String name;
  final List<String> departmentIds;

  College(this.id, this.name, this.departmentIds);

  College.fromJson(Map<String, dynamic> data)
      : this.id = data['id']!,
        this.name = data['name']!,
        this.departmentIds = data['departmentIds']!;

  Map<String, dynamic> toJson() =>
      {'id': this.id, 'name': this.name, 'departmentIds': this.departmentIds};
}
