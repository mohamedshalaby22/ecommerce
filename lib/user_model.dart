// ignore_for_file: unnecessary_null_comparison

class UserModel {
  String? userId, name, email, pic;

  UserModel(
      {required this.userId,
      required this.name,
      required this.email,
      required this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    pic = map['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'pic': pic,
    };
  }
}
