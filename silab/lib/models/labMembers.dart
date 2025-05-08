class LabMember {
  int id;
  int? isLabLeader;
  int? isActive;
  int? laboratoryId;
  int? staffId;
  String? name; // tambahan untuk ambil dari JSON

  LabMember({
    required this.id,
    this.isLabLeader,
    this.isActive,
    this.laboratoryId,
    this.staffId,
    this.name,
  });

  factory LabMember.fromJson(Map<String, dynamic> json) {
    return LabMember(
      id: json['id'],
      isLabLeader: json['is_lab_leader'],
      isActive: json['is_active'],
      laboratoryId: json['laboratory_id'],
      staffId: json['staff_id'],
      name: json['name'], // ambil name dari JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_lab_leader': isLabLeader,
      'is_active': isActive,
      'laboratory_id': laboratoryId,
      'staff_id': staffId,
      'name': name,
    };
  }
}
