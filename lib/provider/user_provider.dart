import 'package:flutter/cupertino.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User _user;

 AuthMethods _auth = AuthMethods();

  User get getUser => _user;

  void refreshUser() async {
    User user = await _auth.getUserDetail();
    _user = user;
    notifyListeners();
  }
}
