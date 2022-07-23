import 'dart:collection';

import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  Cart({
    required this.id,
    required this.title,
    required this.number,
    required this.price,
    required this.imgUrl,
  });
}

class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemsCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.number;
    });

    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (value) => Cart(
        id: value.id,
        title: value.title,
        price: value.price,
        imgUrl: value.imgUrl,
        number: value.number + 1,
      ));
    } else {
      _cartItems.putIfAbsent(productId, () =>  Cart(
        id: productId,
        title: title,
        price: price,
        imgUrl: imgUrl,
        number: 1,
      ));
    }

    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);

    notifyListeners();
  }

  void updateItemsAddOne(String productId) {
    _cartItems.update(productId, (value) => Cart(
      id: value.id,
      title: value.title,
      price: value.price,
      imgUrl: value.imgUrl,
      number: value.number + 1,
    ));

    notifyListeners();
  }

  void updateItemsRemoveOne(String productId) {
    if (_cartItems[productId]!.number < 2) {
      deleteItem(productId);
    } else {
      _cartItems.update(productId, (value) => Cart(
        id: value.id,
        title: value.title,
        price: value.price,
        imgUrl: value.imgUrl,
        number: value.number - 1,
      ));
    }

    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}