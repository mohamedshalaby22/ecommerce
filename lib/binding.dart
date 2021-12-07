import 'package:ecommerce/getx.dart';
import 'package:ecommerce/home_bottom.dart';
import 'package:ecommerce/screens/cartview_model.dart';

import 'package:get/get.dart';

import 'screens/explore_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeBottom());
    Get.lazyPut(() => ExploreViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
