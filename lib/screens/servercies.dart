// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';

//حلقه الوصل بيني وبين السرفر
class HomeServerices {
  //هنا باخد كوليكشن انستانس  من الفايرستور
  final CollectionReference _categoriesCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productsCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _categoriesCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSellingProducts() async {
    var value = await _productsCollectionRef.get();
    return value.docs;
  }
}
