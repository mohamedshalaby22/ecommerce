import 'package:ecommerce/storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  //ميثود لعمل تسجيل خروج من الاكونت
  late final LocalStroageData localStroageData = Get.find();
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStroageData.deleteUser();
  }
}
