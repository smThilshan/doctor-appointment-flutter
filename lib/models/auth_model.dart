import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isLogin {
    return _isAuthenticated;
  }

  void loginsuccess() {
    _isAuthenticated = true;
    notifyListeners();
  }
}
