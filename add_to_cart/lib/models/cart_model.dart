import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List addtocart = [];
  addToCart(index) {
    addtocart.add(index);
    notifyListeners();
  }

  removeFromCart(index) {
    addtocart.remove(index);
    notifyListeners();
  }
}
