// import 'user.dart';

// class Staff {
//   final int id;
//   final int? status;
//   final int? staffStatusId;
//   final int? userId;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final User? user;

//   Staff({
//     required this.id,
//     this.status,
//     this.staffStatusId,
//     this.userId,
//     this.createdAt,
//     this.updatedAt,
//     this.user,
//   });

//   factory Staff.fromJson(Map<String, dynamic> json) {
//     return Staff(
//       id: json['id'],
//       status: json['status'],
//       staffStatusId: json['staff_status_id'],
//       userId: json['user_id'],
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'])
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'])
//           : null,
//       user: json['user'] != null ? User.fromJson(json['user']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'status': status,
//       'staff_status_id': staffStatusId,
//       'user_id': userId,
//       'created_at': createdAt?.toIso8601String(),
//       'updated_at': updatedAt?.toIso8601String(),
//       'user': user?.toJson(),
//     };
//   }
// }
