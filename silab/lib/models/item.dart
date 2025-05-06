import 'package:silab/models/item_type.dart';
import 'package:silab/models/lab_item.dart';
import 'package:silab/models/unit.dart';

class Item {
  final int id;
  final String itemName;
  final String itemCode;
  final int quantity;
  final String specification;
  final String description;
  final int? userId;
  final int? unitId;
  final int? itemTypeId;
  final Unit? unit;
  final ItemType? itemType;
  final List<LabItem>? labItems;

  Item({
    required this.id,
    required this.itemName,
    required this.itemCode,
    required this.quantity,
    required this.specification,
    required this.description,
    this.userId,
    this.unitId,
    this.itemTypeId,
    this.unit,
    this.itemType,
    this.labItems,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      itemName: json['item_name'],
      itemCode: json['item_code'],
      quantity: json['quantity'],
      specification: json['specification'],
      description: json['description'],
      userId: json['user_id'],
      unitId: json['unit_id'],
      itemTypeId: json['item_type_id'],
      unit: json['unit'] != null ? Unit.fromJson(json['unit']) : null,
      itemType: json['item_type'] != null ? ItemType.fromJson(json['item_type']) : null,
      labItems: json['lab_items'] != null
          ? (json['lab_items'] as List)
              .map((i) => LabItem.fromJson(i))
              .toList()
          : null,
    );
  }
}