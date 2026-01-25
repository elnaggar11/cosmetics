import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_button.dart';

import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/verify_view.dart';
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
                AppInput(
                  label: 'Your Full Name',
                  validator: InputValidator.nameValidator,
                ),
                SizedBox(height: 16.h),
                AppInput(withCountryCode: true, label: 'Phone Number'),
                SizedBox(height: 16.h),
                AppInput(isPassword: true, label: 'Your password'),
                SizedBox(height: 12.h),
                AppInput(
                  isPassword: true,
                  label: 'Your Password again',
                  textInputAction: TextInputAction.done,
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
                SizedBox(height: 50.h),
                AppLoginOrRegister(isLogin: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
