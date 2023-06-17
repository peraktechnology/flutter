import 'package:flutter/material.dart';

import '../models/users.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(email: '', username: '', uid: '', userType: '');

  User get user => _user;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
