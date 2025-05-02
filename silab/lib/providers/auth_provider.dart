import 'package:flutter/widgets.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = true;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}