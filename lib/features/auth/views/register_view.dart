import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/helper/navigate.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
import 'package:cosmetics/features/auth/views/verify_view.dart';
import 'package:cosmetics/features/auth/widgets/phone_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isPasswordVisible = true;
  bool isRegister = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/images/logo_icon.png',
                  height: 62.h,
                  width: 67.w,
                ),
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
                SizedBox(height: 50.h),
                CustomTextField(hintText: 'Your Full Name'),
                SizedBox(height: 16.h),
                PhoneInput(),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'Your Password',
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
                SizedBox(height: 12.h),
                CustomTextField(
                  hintText: 'Your Password again',
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
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: AppButton(
                    text: 'Next',
                    onTap: () {
                      navigateTo(VerifyView(isRegister: isRegister));
                    },
                  ),
                ),
                SizedBox(height: 80.h),
                Text.rich(
                  TextSpan(
                    text: "Have an account? ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff434C6D),
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
