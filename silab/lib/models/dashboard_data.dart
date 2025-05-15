import 'package:silab/models/equipment_loan.dart';

class DashboardData {
  final int totalStaffActive;
  final int totalStaffNonactive;
  final List<EquipmentLoan>? equipmentLoans;

  DashboardData({
    required this.totalStaffActive,
    required this.totalStaffNonactive,
    required this.equipmentLoans,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      totalStaffActive: json['total_staff_active'],
      totalStaffNonactive: json['total_staff_nonactive'],
      equipmentLoans: json['equipment_loans'] != null
          ? (json['equipment_loans'] as List)
              .map((e) => EquipmentLoan.fromJson(e))
              .toList()
          : null,
    );
  }
}