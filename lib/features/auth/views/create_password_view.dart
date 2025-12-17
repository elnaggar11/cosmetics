import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                AppImage(image: 'logo_icon.png', height: 62.h, width: 67.w),
                SizedBox(height: 40.h),
                Text(
                  'Create Password',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'montserrat',
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Please enter your phone number below \n       to recovery your password.',
                  style: TextStyle(
                    color: Color(0xFF8E8EA9),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: 'montserrat',
                  ),
                ),
                SizedBox(height: 45.h),
                CustomTextField(
                  hintText: 'New Password',
                  obscureText: _isPasswordVisible,
                  suffixIcon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: AppImage(
                        image: 'password_view.json',
                        onLottieClicked: () {
                          _isPasswordVisible = !_isPasswordVisible;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'Confirm Password',
                  obscureText: _isPasswordVisible,
                  suffixIcon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: AppImage(
                        image: 'password_view.json',
                        onLottieClicked: () {
                          _isPasswordVisible = !_isPasswordVisible;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: AppButton(text: 'Confirm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
