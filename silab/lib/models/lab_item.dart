class LabItem {
  final int id;
  final String? code;
  final String? description;
  final int stock;
  final int? laboratoryId;
  final int? itemId;
  final int isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  LabItem({
    required this.id,
    this.code,
    this.description,
    required this.stock,
    this.laboratoryId,
    this.itemId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LabItem.fromJson(Map<String, dynamic> json) {
    return LabItem(
      id: json['id'],
      code: json['code'],
      description: json['description'],
      stock: json['stock'],
      laboratoryId: json['laboratory_id'],
      itemId: json['item_id'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'description': description,
      'stock': stock,
      'laboratory_id': laboratoryId,
      'item_id': itemId,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}