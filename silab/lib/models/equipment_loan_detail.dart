
class EquipmentLoanDetail {
  final int id;
  final int? qty;
  final int? returnQty;
  final String? description;
  final int? status; // 1 => complete, 2 => incomplete
  final int equipmentLoanId;
  final int? labItemId;
  final int? stockCardId;
  final int? stockCardIdReturn;
  final DateTime createdAt;
  final DateTime updatedAt;

  EquipmentLoanDetail({
    required this.id,
    required this.qty,
    this.returnQty,
    this.description,
    this.status,
    required this.equipmentLoanId,
    required this.labItemId,
    this.stockCardId,
    this.stockCardIdReturn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EquipmentLoanDetail.fromJson(Map<String, dynamic> json) {
    return EquipmentLoanDetail(
      id: json['id'],
      qty: json['qty'],
      returnQty: json['return_qty'],
      description: json['description'],
      status: json['status'],
      equipmentLoanId: json['equipment_loan_id'],
      labItemId: json['lab_item_id'],
      stockCardId: json['stock_card_id'],
      stockCardIdReturn: json['stock_card_id_return'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qty': qty,
      'return_qty': returnQty,
      'description': description,
      'status': status,
      'equipment_loan_id': equipmentLoanId,
      'lab_item_id': labItemId,
      'stock_card_id': stockCardId,
      'stock_card_id_return': stockCardIdReturn,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}