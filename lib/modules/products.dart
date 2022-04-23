import 'package:uet_hackathon_2022/constants/constants.dart';

class Product {
  final String name;
  final double price;
  final String banner;

  Product({
    required this.name,
    required this.price,
    required this.banner,
  });
}

List<Product> allProduct = [
  Product(name: 'Gà', price: 50000, banner: product1),
  Product(name: 'Chó', price: 50000, banner: product2),
  Product(name: 'Lợn', price: 50000, banner: product3),
  Product(name: 'Mèo', price: 50000, banner: product4),
  Product(name: 'Rau', price: 50000, banner: product5),
  Product(name: 'Củ', price: 50000, banner: product6),
  Product(name: 'Quả', price: 50000, banner: product2),
  Product(name: 'Bắp cải', price: 50000, banner: product1),
  Product(name: 'Cà chua', price: 50000, banner: product3),
  Product(name: 'Con lợn con', price: 50000, banner: product3),
];
