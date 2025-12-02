import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.text = '', this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
