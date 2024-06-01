import 'package:dark_light_theme/models/items.dart';
import 'package:dark_light_theme/models/view.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Items> _shop = [
    Items(
      imageDescription:
          "A sleek and stylish black hoodie with a soft fleece interior, perfect for keeping you warm and comfortable in any season. The minimalist design makes it versatile for casual or semi-formal outfits.",
      imagePath: "images/1.png",
      name: "Hoodie",
      price: 200,
    ),
    Items(
      imageDescription:
          "Stylish sunglasses with UV protection, designed to keep your eyes safe while adding a fashionable touch to any outfit.",
      imagePath: "images/2.png",
      name: "Sunglasses",
      price: 80,
    ),
    Items(
      imageDescription:
          "A sophisticated wristwatch with a durable leather strap and a sleek, modern design. Ideal for both everyday wear and special occasions.",
      imagePath: "images/3.png",
      name: "Smart Watch",
      price: 300,
    ),
    Items(
      imageDescription:
          "These trendy Jordan shoes offer a perfect blend of comfort and style, featuring a cushioned sole and breathable fabric for all-day wear.",
      imagePath: "images/4.png",
      name: "Jordan Shoes",
      price: 150,
    ),
    Items(
      imageDescription:
          "The latest iPhone X with a stunning display, powerful performance, and advanced camera features for capturing every moment.",
      imagePath: "images/5.png",
      name: "iPhone X",
      price: 999,
    ),
    Items(
      imageDescription:
          "A versatile jacket with a modern design, perfect for keeping you warm and stylish in any weather. Features multiple pockets and a comfortable fit.",
      imagePath: "images/6.png",
      name: "Jacket",
      price: 120,
    ),
  ];

  List<Items> cart = [];
  List<Items> getItems() => _shop;
  List<Items> getCart() => cart;
  void addToCart(product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(context, product) {
    cart.remove(product);
    notifyListeners();
  }

  final List<ViewTile> views = [
    ViewTile(
        title: "Address",
        subtitle: "Pokhara, 16 GharmiKhola",
        imageDescription: "images/address.png"),
    ViewTile(
        title: "Website",
        subtitle: "www.google.com",
        imageDescription: "images/website.png"),
    ViewTile(
        title: "Phone",
        subtitle: "9800000000",
        imageDescription: "images/phone.png"),
    ViewTile(
        title: "Email",
        subtitle: "adhikariankit553@gmail.com",
        imageDescription: "images/email.png"),
    ViewTile(
        title: "Twitter",
        subtitle: "https://x.com/_illusion_69",
        imageDescription: "images/twitter.png"),
    ViewTile(
        title: "GitHub",
        subtitle: "https://github.com/itsmeankeet",
        imageDescription: "images/github.png")
  ];

  List<ViewTile> getView() => views;
}
