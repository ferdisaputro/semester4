class Department {
  int id;
  String? code;
  String? department;
  String? createdAt;
  String? updatedAt;

  Department({
    required this.id,
    this.code,
    this.department,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      code: json['code'],
      department: json['department'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'department': department,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}