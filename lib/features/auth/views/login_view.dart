import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/helper/navigate.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
import 'package:cosmetics/core/utils/ui/success_massage.dart';
import 'package:cosmetics/features/auth/views/register_view.dart';
import 'package:cosmetics/features/auth/widgets/phone_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = true;
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
                Image.asset('assets/images/login.png'),
                SizedBox(height: 20.h),
                Text(
                  'Login Now',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    fontFamily: 'montserrat',
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Please enter the details below to continue',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontFamily: 'montserrat',
                  ),
                ),
                SizedBox(height: 25.h),
                PhoneInput(),
                SizedBox(height: 7.h),
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
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.primaryColor,
                        fontFamily: 'montserrat',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: AppButton(
                    text: 'Login',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessMassage();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 80.h),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff434C6D),
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            navigateTo(RegisterView());
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
