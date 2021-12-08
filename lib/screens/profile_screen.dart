// ignore_for_file: avoid_unnecessary_containers

import 'package:ecommerce/screens/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Center(
        child: Container(
          child: InkWell(
            onTap: () {
              controller.signOut();
              Get.offAll(HomeScreen());
            },
            child: const Text(
              'SignOut',
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
