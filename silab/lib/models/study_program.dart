class StudyProgram {
  final int id;
  final String? code;
  final String studyProgram;
  final int? departmentId;
  final int? userId;

  StudyProgram({
    required this.id,
    this.code,
    required this.studyProgram,
    this.departmentId,
    this.userId,
  });

  factory StudyProgram.fromJson(Map<String, dynamic> json) {
    return StudyProgram(
      id: json['id'],
      code: json['code'],
      studyProgram: json['study_program'],
      departmentId: json['department_id'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'study_program': studyProgram,
      'department_id': departmentId,
      'user_id': userId,
    };
  }
}
