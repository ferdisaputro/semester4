import 'package:silab/models/labMembers.dart';

class Laboratory {
  int id;
  String? code;
  String? laboratoryName;
  String? acronym;
  String? color;
  int? departmentId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<LabMember>? formatedHeadOfLab;

  Laboratory({
    required this.id,
    this.code,
    this.laboratoryName,
    this.acronym,
    this.color,
    this.departmentId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.formatedHeadOfLab,
  });

  factory Laboratory.fromJson(Map<String, dynamic> json) {
    return Laboratory(
      id: json['id'],
      code: json['code'],
      laboratoryName: json['name'],
      acronym: json['acronym'],
      color: json['color'],
      departmentId: json['departmentId'],
      userId: json['userId'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      formatedHeadOfLab: json['formatedHeadOfLab'] != null
          ? (json['formatedHeadOfLab'] as List)
              .map((item) => LabMember.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': laboratoryName,
      'acronym': acronym,
      'color': color,
      'departmentId': departmentId,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'formatedHeadOfLab': formatedHeadOfLab?.map((e) => e.toJson()).toList(),
    };
  }
}

// class Labmember {
//   int id;
//   String name;

//   LabMember({required this.id, required this.name});

//   factory LabMember.fromJson(Map<String, dynamic> json) {
//     return LabMember(
//       id: json['id'],
//       name: json['name'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//       };
// }
