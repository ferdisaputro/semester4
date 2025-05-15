class Unit {
  final int id;
  final String satuan;
  final int? userId;

  Unit({
    required this.id,
    required this.satuan,
    this.userId,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      satuan: json['satuan'],
      userId: json['user_id'],
    );
  }
}