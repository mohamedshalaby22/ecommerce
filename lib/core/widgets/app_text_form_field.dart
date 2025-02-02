import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.enabledBorder,
      this.focusedBorder,
      required this.hintText,
      this.contentPadding,
      this.backgroundColor,
      this.hintStyle,
      this.textStyle,
      this.isObscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.controller,
      this.maxLines,
      this.inputFormatters,
      this.textInputType,
      required this.validator});
  final InputBorder? enabledBorder, focusedBorder;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final TextStyle? hintStyle, textStyle;
  final bool? isObscureText;
  final Widget? suffixIcon,prefixIcon;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      style: textStyle ?? TextStyles.font28MainBlueBold,
      obscureText: isObscureText ?? false,
      cursorColor: ColorsManager.mainBlue,
      maxLines: maxLines ?? 1,
      keyboardType: textInputType ?? TextInputType.text,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: ColorsManager.mainBlue, width: 1.1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                const BorderSide(color: ColorsManager.mainBlue, width: 1.1)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red, width: 1.1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red, width: 1.1)),
        suffixIcon: suffixIcon ?? const SizedBox(),
        prefixIcon: prefixIcon,
        hintStyle: hintStyle ?? TextStyles.font28MainBlueBold,
        hintText: hintText,
        filled: true,
        fillColor:  Colors.white,
      ),
    );
  }
}
