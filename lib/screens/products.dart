// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/screens/colors.dart';
import 'package:flutter/material.dart';

class ProductsModel {
  late String name, image, description, size, price;
  late Color color;
  ProductsModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.size,
      required this.price});
  ProductsModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
  }
  toJson() {
    return {
      "name": name,
      "image": image,
      "description": description,
      "color": color,
      "size": size,
      "price": price,
    };
  }
}
//