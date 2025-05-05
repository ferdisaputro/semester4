import 'package:silab/models/user.dart';

class StaffBorrower {
  final int id;
  final bool status;
  final int? staffStatusId;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;  

  StaffBorrower({
    required this.id,
    required this.status,
    this.staffStatusId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  factory StaffBorrower.fromJson(Map<String, dynamic> json) {
    return StaffBorrower(
      id: json['id'],
      status: json['status'] == 1,
      staffStatusId: json['staff_status_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}