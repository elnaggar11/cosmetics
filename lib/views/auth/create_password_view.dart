import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/success_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

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
                AppImage(image: 'logo_icon.png', height: 62.h, width: 67.w),
                SizedBox(height: 40.h),
                Text(
                  'Create Password',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Please enter your phone number below \n       to recovery your password.',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 45.h),
                AppInput(hintText: 'New Password', isPassword: true),
                SizedBox(height: 16.h),
                AppInput(hintText: 'Confirm Password', isPassword: true),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: AppButton(
                    text: 'Confirm',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SuccessMassage(isRegister: false);
                        },
                      );
                    },
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
