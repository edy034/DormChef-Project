import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? uid;

  void setUID(String uid) {
    this.uid = uid;
    notifyListeners();
  }

  void clearUID() {
    uid = null;
    notifyListeners();
  }
}