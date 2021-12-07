// ignore_for_file: must_be_immutable

import 'package:ecommerce/components.dart';
import 'package:ecommerce/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'getx.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Get.offAll(HomeScreen());
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                defaultTextFormField(
                    onSaved: (value) {
                      controller.name = value;
                    },
                    type: TextInputType.name,
                    prefix: Icons.people,
                    text: 'Name'),
                const SizedBox(
                  height: 15,
                ),
                defaultTextFormField(
                    onSaved: (value) {
                      controller.email = value;
                    },
                    type: TextInputType.emailAddress,
                    prefix: Icons.email,
                    text: 'Email'),
                const SizedBox(
                  height: 15,
                ),
                defaultTextFormField(
                    onSaved: (value) {
                      controller.password = value;
                    },
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    text: 'Password'),
                const SizedBox(
                  height: 45,
                ),
                Center(
                    child: defaultButton(
                  pressed: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN UP',
                  width: 350,
                  height: 55,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
