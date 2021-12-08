// ignore_for_file: unnecessary_overrides, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, unused_element

import 'dart:convert';

import 'package:ecommerce/fire_store.dart';
import 'package:ecommerce/storage_data.dart';
import 'package:ecommerce/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'controller_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth auth = FirebaseAuth.instance;
  String? email, password, name;
  late final LocalStroageData localStroageData = Get.find();
  final Rxn<User> _user = Rxn<User>();
  //هنا عشان لو اليوزر له قيمه يعرضها ملوش يحوله يعمل ايميل
  String? get user => _user.value?.email;
  // FacebookLogin facebookLogin = FacebookLogin();

  @override
  void onInit() {
    super.onInit();
    //دي ميثود جايه من الفايربيز بستخدمها عشان اعمل اسنريم علي الازونتكيشين
    _user.bindStream(auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    // ignore: unused_local_variable
    final GoogleSignInAccount = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await GoogleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(const ControllerView());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        //بجيب الداتا وبحفظها في الشيرد
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromJson(value.data() as Map<String, dynamic>));
          Get.offAll(() => const ControllerView());
        });
      });
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar(
        'Error Login Account',
        e.message.toString(),
        colorText: const Color(0xff000000),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          // user هنا بتحتوي علي الداتا بتاع اليوزر
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(const ControllerView());
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar(
        'Error Login Account',
        e.message.toString(),
        colorText: const Color(0xff000000),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      email: user.user!.email,
      userId: user.user!.uid,
      name: name ?? user.user!.displayName,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStroageData.setUser(userModel);
  }
}
