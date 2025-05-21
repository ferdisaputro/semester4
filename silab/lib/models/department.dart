class Department {
  final int id;
  final String? code;
  final String department;
  final int? userId;
  String? createdAt;
  String? updatedAt;

  Department({
    required this.id,
    this.code,
    required this.department,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      code: json['code'],
      department: json['department'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // get name => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'department': department,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
