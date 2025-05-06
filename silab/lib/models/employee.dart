class Employee {
  int id;
  String name;
  String? email;
  String? phone;
  String? photo;
  String? staffStatus;
  int status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Employee({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.photo,
    this.staffStatus,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      photo: json['user']['photo'],
      staffStatus: json['staff_status']['staff_status'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
      'staff_status': staffStatus,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
