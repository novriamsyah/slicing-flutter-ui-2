import 'package:flutter/material.dart';

class Product {
  final int id;
  final String productName;
  final String imgProduct;
  final double price;
  final List<Color> colors;
  final List<int> size;

  Product({
    required this.id,
    required this.productName,
    required this.imgProduct,
    required this.price,
    required this.colors,
    required this.size,
  });

  static List<Product> products = [
    Product(
      id: 0,
      productName: "Nike Marathon",
      imgProduct: "assets/images/shoes1.png",
      price: 227.10,
      colors: [
        Colors.purple,
        Colors.red,
        Colors.blue,
      ],
      size: [
        39,
        41,
        42,
      ],
    ),
    Product(
      id: 1,
      productName: "Nike Low Junior",
      imgProduct: "assets/images/shoes3.png",
      price: 87.09,
      colors: [
        Colors.green,
        Colors.blue.shade300,
        Colors.deepPurple,
      ],
      size: [
        39,
        41,
        42,
      ],
    ),
    Product(
      id: 2,
      productName: "Nike Air Max 95",
      imgProduct: "assets/images/shoes2.png",
      price: 127.99,
      colors: [
        Colors.blue,
        Colors.orange,
        Colors.red,
      ],
      size: [
        39,
        41,
        42,
      ],
    ),
    Product(
      id: 3,
      productName: "Nike Air Force",
      imgProduct: "assets/images/shoes4.png",
      price: 97.30,
      colors: [
        Colors.green.shade900,
        Colors.blue,
        Colors.brown,
      ],
      size: [
        39,
        41,
        42,
      ],
    ),
    Product(
      id: 4,
      productName: "Nike Infinity 5",
      imgProduct: "assets/images/shoes5.png",
      price: 117.00,
      colors: [
        Colors.blue,
        Colors.red,
        Colors.black,
      ],
      size: [
        39,
        41,
        42,
      ],
    ),
  ];
}
