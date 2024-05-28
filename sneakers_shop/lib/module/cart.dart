import 'package:flutter/material.dart';
import 'package:sneakers_shop/module/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air Force 1",
        price: 180,
        imagePath: "images/1.png",
        imageDescription:
            "The Air Force 1: Classic low-top sneaker, iconic Nike Swoosh, versatile design, comfortable fit, timeless style."),
    Shoe(
        name: "Blazer",
        price: 200,
        imagePath: "images/2.png",
        imageDescription:
            "The Blazer: Modern twist on a classic silhouette, innovative design elements, premium materials, perfect for everyday wear."),
    Shoe(
        name: "Crater",
        price: 160,
        imagePath: "images/3.png",
        imageDescription:
            "The Crater: Sustainable sneaker made with recycled materials, lightweight construction, unique aesthetic, eco-conscious choice."),
    Shoe(
        name: "Jordan",
        price: 220,
        imagePath: "images/4.png",
        imageDescription:
            "The Jordan: Iconic basketball shoe, legendary Michael Jordan branding, superior performance, bold style statement."),
  ];
  // ignore: non_constant_identifier_names
  List<Shoe> UserCart = [];

  List<Shoe> getShoe() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return UserCart;
  }

  void addCartToItem(Shoe shoe) {
    UserCart.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    UserCart.remove(shoe);
    notifyListeners();
  }
}
