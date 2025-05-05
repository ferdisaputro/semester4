class User {
  final int id;
  final String name;
  final String? code;
  final String email;
  final String? phone;
  final String? photo;
  final DateTime? emailVerifiedAt;
  final String? password;
  final String? rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    this.code,
    required this.email,
    this.phone,
    this.photo,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      password: json['password'],
      rememberToken: json['remember_token'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}