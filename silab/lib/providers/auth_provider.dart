import 'package:flutter/widgets.dart';
import 'package:silab/models/user.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _token = null;
  User? _user = null;
 
  bool get isAuthenticated => _isAuthenticated;
  String get token => _token!;
  User get user => _user!;

  void login(Map<String, dynamic> json) {
    if (json['token'] != null) {
      _token = json['token'];
      _user = User.fromJson(json['user']); // Assuming User has a fromJson method
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}