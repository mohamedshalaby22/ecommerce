// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          'ProfileScreen',
          style: TextStyle(fontSize: 40, color: Colors.purpleAccent),
        ),
      ),
    );
  }
}