class StaffStatus {
  final int id;
  final String staffStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  StaffStatus({
    required this.id,
    required this.staffStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a StaffStatus object from a JSON map
  factory StaffStatus.fromJson(Map<String, dynamic> json) {
    return StaffStatus(
      id: json['id'],
      staffStatus: json['staff_status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert a StaffStatus object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staff_status': staffStatus,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}