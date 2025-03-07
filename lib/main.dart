import 'package:ecommerce/core/helpers/auth_status_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  setupGetIt();
  await AuthStatusHandler.checkUserLoginStatus();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EcommerceApp(appRouter: AppRouter()));
}
