
class HeadOfStudyProgram {
  int id;
  int? studyProgramId;
  int? staffId;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;


  HeadOfStudyProgram({
    required this.id,
    this.studyProgramId,
    this.staffId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory HeadOfStudyProgram.fromJson(Map<String, dynamic> json) {
    return HeadOfStudyProgram(
      id: json['id'],
      studyProgramId: json['study_program_id'],
      staffId: json['staff_id'],
      isActive: json['is_active'],
      createdAt:
          json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt:
          json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'study_program_id': studyProgramId,
      'staff_id': staffId,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
