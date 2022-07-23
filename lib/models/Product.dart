import 'dart:collection';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String desc;
  final String imgUrl;
  final num price;
  final color;

  Product({
    required this.id,
    required this.title,
    required this.desc,
    required this.imgUrl,
    required this.price,
    required this.color
  });
}

class ProductDataProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Мохито',
      desc: 'Разрежьте лайм на 4 дольки. Положите листья мяты и 2 дольки лайма в стакан из толстого стекла. Подавите мяту и лайм мадлером или ложкой, чтобы они пустили сок. Добавьте ещё 1 дольку лайма и сахар, а после снова подавите.',
      imgUrl: 'https://cdn.lifehacker.ru/wp-content/uploads/2018/07/shutterstock_551620234_1576766224-e1576766275506-630x315.jpg',
      color: '0xFFFFF59D',
      price: 15.00,
    ),
    Product(
      id: 'p2',
      title: 'Дайкири',
      desc: 'Разрежьте лайм на 4 дольки. Положите листья мяты и 2 дольки лайма в стакан из толстого стекла. Подавите мяту и лайм мадлером или ложкой, чтобы они пустили сок. Добавьте ещё 1 дольку лайма и сахар, а после снова подавите.',
      imgUrl: 'https://cdn.lifehacker.ru/wp-content/uploads/2018/07/shutterstock_674544829_1576766400-e1576766434114-630x315.jpg',
      color: '0xFFFFF59D',
      price: 25.00,
    ),
    Product(
      id: 'p3',
      title: 'Манхэттен',
      desc: 'Разрежьте лайм на 4 дольки. Положите листья мяты и 2 дольки лайма в стакан из толстого стекла. Подавите мяту и лайм мадлером или ложкой, чтобы они пустили сок. Добавьте ещё 1 дольку лайма и сахар, а после снова подавите.',
      imgUrl: 'https://cdn.lifehacker.ru/wp-content/uploads/2018/07/shutterstock_714183058_1576766666-e1576766688809-630x315.jpg',
      color: '0xFFFFF59D',
      price: 20.00,
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) => _items.singleWhere((element) => element.id == id);
}