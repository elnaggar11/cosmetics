import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
import 'package:cosmetics/features/auth/presentation/widgets/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              Text(
                'Login Now',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                  fontFamily: 'montserrat',
                ),
              ),
              Text(
                'Please enter the details below to continue',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontFamily: 'montserrat',
                ),
              ),
              PhoneInput(),
              SizedBox(height: 20.h),
              CustomTextField(hintText: 'Your Password', obscureText: true),
            ],
          ),
        ),
      ),
    );
  }
}
