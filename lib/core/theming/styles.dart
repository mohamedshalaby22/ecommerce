import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font28MainBlueBold = TextStyle(
    fontSize: 28.sp,
    color: ColorsManager.mainGreen,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18MainGreenSemiBold = TextStyle(
    fontSize: 18.sp,
    color: ColorsManager.mainGreen,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20BlackSemiBold = TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightHelper.regular,
  );
}
