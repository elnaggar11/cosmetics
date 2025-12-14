import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessMassage extends StatelessWidget {
  const SuccessMassage({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        AppImage(image: 'Done.json', height: 100.h, width: 100.w),
        Text(
          'Account Activated!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Congratulations! Your account has been successfully activated',
          style: TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.r),
          child: AppButton(text: 'Go To Home'),
        ),
      ],
    );
  }
}
