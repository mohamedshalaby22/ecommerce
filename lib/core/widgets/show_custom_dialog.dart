import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';

/// General-purpose dialog for delete, error, and success scenarios
Future<dynamic> showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  required IconData icon,
  required Color iconColor,
  required String primaryButtonText,
  VoidCallback? onPrimaryPressed,
  String? secondaryButtonText,
  VoidCallback? onSecondaryPressed,
}) {
  return showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: iconColor, width: 2.5),
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: iconColor.withOpacity(0.2),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 27,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(15),
                      Text(
                        title,
                        style: TextStyles.font28MainBlueBold,
                      ),
                      verticalSpace(3),
                      Text(
                        message,
                        style: TextStyles.font28MainBlueBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                if (secondaryButtonText != null)
                  Expanded(
                    child: AppTextButton(
                      buttonText: secondaryButtonText,
                      buttonHeight: 20,
                      onPressed: () {
                        if (onSecondaryPressed != null) {
                          onSecondaryPressed();
                        }
                        Navigator.of(context).pop();
                      },
                      textStyle: TextStyles.font28MainBlueBold,
                      borderColor: Colors.grey,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                if (secondaryButtonText != null) horizontalSpace(10),
                Expanded(
                  child: AppTextButton(
                    buttonText: primaryButtonText,
                    buttonHeight: 20,
                    onPressed:
                        onPrimaryPressed ?? () => Navigator.of(context).pop(),
                    textStyle: TextStyles.font28MainBlueBold,
                    backgroundColor: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
