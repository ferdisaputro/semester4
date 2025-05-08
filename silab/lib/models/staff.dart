import 'package:silab/models/staff_status.dart';
import 'package:silab/models/user.dart';

class Staff {
  final int id;
  final bool status;
  final int? staffStatusId;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;  
  final StaffStatus? staffStatus;

  Staff({
    required this.id,
    required this.status,
    this.staffStatusId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.user,
    this.staffStatus,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      status: json['status'] == 1,
      staffStatusId: json['staff_status_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      staffStatus: json['staff_status'] != null ? StaffStatus.fromJson(json['staff_status']) : null,
    );
  }
}