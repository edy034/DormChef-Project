import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String? uid;

  UserProvider({required this.uid});

  void setUID(String uid) {
    this.uid = uid;
    notifyListeners();
  }

  void clearUID() {
    uid = null;
    notifyListeners();
  }
}
