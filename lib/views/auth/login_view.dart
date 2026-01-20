import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/views/auth/forget_password_view.dart';
import 'package:cosmetics/views/auth/register_view.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                AppImage(image: 'login.png'),
                SizedBox(height: 20.h),
                Text(
                  'Login Now',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Please enter the details below to continue',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 25.h),
                AppInput(withCountryCode: true, hintText: 'Phone Number'),
                SizedBox(height: 7.h),
                AppInput(isPassword: true, hintText: 'Your password'),

                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    navigateTo(ForgetPasswordView());
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).primaryColor,
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
                      navigateTo(HomeView(), canPop: false);
                    },
                  ),
                ),
                SizedBox(height: 80.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateTo(RegisterView());
                      },
                      child: Text(
                        'Register',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
