import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/pin_code_text_field_widget.dart';

class VerifyWidgets extends StatelessWidget {
  const VerifyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Image.asset('assets/images/logo_icon.png', height: 62.h, width: 67.w),
        SizedBox(height: 40.h),
        Text(
          'Create Account',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
            fontFamily: 'montserrat',
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.r),
          child: Text.rich(
            TextSpan(
              text: 'We just sent a 4-digit verification code to\n',
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(
                  text: '+20 1022658997',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(text: ' Enter the code in the box below to continue'),
              ],
            ),
          ),
        ),
        SizedBox(height: 40.h),
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Edit the number',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        const PinCodeTextFieldWidget(),
      ],
    );
  }
}
