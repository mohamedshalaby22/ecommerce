// ignore_for_file: unnecessary_null_comparison

class CartModel {
  late String name, image,productId, price;
  late int quanity;
  CartModel(
      {required this.name,
      required this.image,
      required this.price,
       required this.productId,
      required this.quanity});
  CartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    productId = map['productId'];
    quanity = map['quanity'];
  }
  toJson() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "productId": productId,
      "quanity": quanity,
    };
  }
}
//