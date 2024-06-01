class Cart {
  late final String name;
  late final int price;
  late final String imagePath;

  Cart({required this.name, required this.price, required this.imagePath});
}

var cartList = [
  Cart(name: "This is jordan", price: 10, imagePath: "images/1.png"),
  Cart(name: "This is jordan", price: 20, imagePath: "images/2.png")
];
