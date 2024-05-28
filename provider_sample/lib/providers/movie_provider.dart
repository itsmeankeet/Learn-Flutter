import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  List favlist = [];

  addtoList(index) {
    favlist.add(index);
    notifyListeners();
  }

  removefav(index) {
    favlist.remove(index);
    notifyListeners();
  }
}
