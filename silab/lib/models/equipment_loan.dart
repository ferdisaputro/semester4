import 'package:silab/models/equipment_loan_detail.dart';
import 'package:silab/models/staff_borrower.dart';
import 'package:silab/models/staff_returner.dart';
import 'package:silab/models/user.dart';

class EquipmentLoan {
  int id;
  String? code;
  int? staffId;
  int? isStaff;
  DateTime borrowingDate;
  String? name;
  String? nim;
  String? groupClass;
  int? staffIdReturner;
  int? isReturnerStaff;
  DateTime? returnDate;
  String? returnerName;
  String? returnerNim;
  String? returnerGroupClass;
  int status;
  int? laboratoryId;
  int? labMemberIdBorrow;
  int? labMemberIdReturn;
  int? staffIdMentor;
  DateTime? createdAt;
  DateTime? updatedAt;
  StaffBorrower? staffBorrower;
  StaffReturner? staffReturner;
  List<EquipmentLoanDetail>? equipmentLoanDetails;
  User? user;

  EquipmentLoan({
    required this.id,
    this.code,
    this.staffId,
    this.isStaff,
    required this.borrowingDate,
    this.name,
    this.nim,
    this.groupClass,
    this.staffIdReturner,
    this.isReturnerStaff,
    this.returnDate,
    this.returnerName,
    this.returnerNim,
    this.returnerGroupClass,
    required this.status,
    this.laboratoryId,
    this.labMemberIdBorrow,
    this.labMemberIdReturn,
    this.staffIdMentor,
    this.createdAt,
    this.updatedAt,
    this.staffBorrower,
    this.staffReturner,
    this.equipmentLoanDetails,
    this.user,
  });

  factory EquipmentLoan.fromJson(Map<String, dynamic> json) {
    return EquipmentLoan(
      id: json['id'] ?? 0,
      code: json['code'],
      staffId: json['staff_id'],
      isStaff: json['is_staff'],
      borrowingDate: DateTime.parse(json['borrowing_date']),
      name: json['name'],
      nim: json['nim'],
      groupClass: json['group_class'],
      staffIdReturner: json['staff_id_returner'],
      isReturnerStaff: json['is_returner_staff'],
      returnDate: json['return_date'] != null ? DateTime.parse(json['return_date']) : null,
      returnerName: json['returner_name'],
      returnerNim: json['returner_nim'],
      returnerGroupClass: json['returner_group_class'],
      status: json['status'] ?? 0,
      laboratoryId: json['laboratory_id'],
      labMemberIdBorrow: json['lab_member_id_borrow'],
      labMemberIdReturn: json['lab_member_id_return'],
      staffIdMentor: json['staff_id_mentor'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      staffBorrower: json['staff_borrower'] != null ? StaffBorrower.fromJson(json['staff_borrower']) : null,
      staffReturner: json['staff_returner'] != null ? StaffReturner.fromJson(json['staff_returner']) : null,
      equipmentLoanDetails: json['loan_details'] != null
          ? (json['loan_details'] as List)
              .map((item) => EquipmentLoanDetail.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'staff_id': staffId,
      'is_staff': isStaff,
      'borrowing_date': borrowingDate.toIso8601String(),
      'name': name,
      'nim': nim,
      'group_class': groupClass,
      'staff_id_returner': staffIdReturner,
      'is_returner_staff': isReturnerStaff,
      'return_date': returnDate?.toIso8601String(),
      'returner_name': returnerName,
      'returner_nim': returnerNim,
      'returner_group_class': returnerGroupClass,
      'status': status,
      'laboratory_id': laboratoryId,
      'lab_member_id_borrow': labMemberIdBorrow,
      'lab_member_id_return': labMemberIdReturn,
      'staff_id_mentor': staffIdMentor,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'staff_borrower': staffBorrower?.toString(),
      'staff_returner': staffReturner?.toString(),
      'loan_details': equipmentLoanDetails?.map((item) => item.toJson()).toList() ?? [],
      
    };
  }
}
