import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';

import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/views/auth/verify_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 50.h),
                AppInput(hintText: 'Your Full Name'),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    AppInput(withCountryCode: true),
                    Expanded(child: AppInput(hintText: 'Phone Number')),
                  ],
                ),
                SizedBox(height: 16.h),
                AppInput(isPassword: true),
                SizedBox(height: 12.h),
                AppInput(isPassword: true, hintText: 'Your Password again'),
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
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Color(0xff434C6D)),
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Color(0xff434C6D),
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
