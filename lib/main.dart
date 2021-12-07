import 'package:ecommerce/controller_view.dart';
import 'package:ecommerce/database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/binding.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartDatabaseHelper.initDb();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          )),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xff09c16d),
          )),
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: const ControllerView(),
    );
  }
}
