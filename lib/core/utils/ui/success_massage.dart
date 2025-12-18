import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/helper/navigate.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
import 'package:cosmetics/features/auth/views/login_view.dart';
import 'package:cosmetics/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessMassage extends StatelessWidget {
  const SuccessMassage({super.key, required this.isRegister});
  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        AppImage(image: 'Done.json'),
        Text(
          isRegister ? 'Account Activated!' : 'Password Created!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          isRegister
              ? 'Congratulations! Your account has been successfully activated'
              : 'Congratulations! Your password has been successfully created',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF8E8EA9),
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.r),
          child: AppButton(
            text: isRegister ? 'Go To Home' : 'Return to login',
            onTap: () {
              navigateTo(LoginView(), canPop: false);
            },
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
