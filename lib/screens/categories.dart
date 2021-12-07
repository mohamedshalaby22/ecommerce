// ignore_for_file: unnecessary_null_comparison

class CategoriesModel {
  late String name, image;

  CategoriesModel({required this.name, required this.image});
  CategoriesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
