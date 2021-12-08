// ignore_for_file: unused_field, await_only_futures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/user_model.dart';

//هنا بضيف اليوزر للفايرستور
class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }
}
