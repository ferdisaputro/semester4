import 'package:silab/models/department.dart';
import 'package:silab/models/head_of_study_program.dart';

class StudyProgram {
  int id;
  String code;
  String studyProgramName;
  int? departmentId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<HeadOfStudyProgram>? headOfStudyPrograms;
  Department? department;
  String? headOfStudyProgramName; // Tambahkan field ini

  StudyProgram({
    required this.id,
    required this.code,
    required this.studyProgramName,
    this.departmentId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.headOfStudyPrograms,
    this.department,
    this.headOfStudyProgramName,
  });

  factory StudyProgram.fromJson(Map<String, dynamic> json) {
    return StudyProgram(
      id: json['id'],
      code: json['code'],
      studyProgramName: json['study_program'],
      departmentId: json['department_id'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      headOfStudyPrograms: (json['head_of_study_programs'] as List<dynamic>?)
          ?.map((e) => HeadOfStudyProgram.fromJson(e))
          .toList(),
      department: json['department'] != null ? Department.fromJson(json['department']) : null,
      headOfStudyProgramName: (json['formatedHeadOfStudyPrograms'] != null &&
              json['formatedHeadOfStudyPrograms'] is List &&
              json['formatedHeadOfStudyPrograms'].isNotEmpty)
          ? json['formatedHeadOfStudyPrograms'][0]['name']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': studyProgramName,
      'department_id': departmentId,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'head_of_study_programs': headOfStudyPrograms?.map((e) => e.toJson()).toList(),
      'department': department?.toJson(),
      'head_of_study_program_name': headOfStudyProgramName, // Optional untuk kebutuhan ke backend
    };
  }
}
