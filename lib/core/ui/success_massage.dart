import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';

import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessMassage extends StatelessWidget {
  const SuccessMassage({super.key, required this.isRegister});
  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        AppImage(image: 'done.json'),
        Text(
          textAlign: TextAlign.center,

          isRegister ? 'Account Activated!' : 'Password Created!',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          isRegister
              ? 'Congratulations! Your account has been successfully activated'
              : 'Congratulations! Your password has been successfully created',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Color(0xFF8E8EA9)),
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
