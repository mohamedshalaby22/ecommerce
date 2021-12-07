// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, avoid_print, use_key_in_widget_constructors

import 'package:ecommerce/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/getx.dart';
import 'package:get/get.dart';
import 'components.dart';

class HomeScreen extends GetWidget<AuthViewModel> {
  //var emailController = TextEditingController();
  //var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Welcome,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(RegisterScreen());
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Color(0xff09c16d),
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: defaultButton(
                    pressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    text: 'SIGN IN',
                    width: 350,
                    height: 55,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      '-OR-',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultLogin(
                      image: 'assets/f.png',
                      text: 'Sign In With Facebook',
                      onpress: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultLogin(
                      image: 'assets/g.png',
                      text: 'Sign In With Google',
                      onpress: () {
                        controller.googleSignInMethod();
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
