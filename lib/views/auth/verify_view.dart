import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_resend_otp.dart';

import 'package:cosmetics/core/ui/pin_code_text_field_widget.dart';
import 'package:cosmetics/core/ui/success_massage.dart';
import 'package:cosmetics/views/auth/create_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key, required this.isRegister});
  final bool isRegister;

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/images/logo_icon.png',
                  height: 62.h,
                  width: 67.w,
                ),
                SizedBox(height: 40.h),
                Text(
                  'Verify Code',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.r),
                  child: Text.rich(
                    TextSpan(
                      text: 'We just sent a 4-digit verification code to\n',
                      style: TextStyle(color: Color(0xFF8E8EA9), fontSize: 14),
                      children: [
                        TextSpan(
                          text: '+20 1022658997',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' Enter the code in the box below to continue',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Edit the number',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const PinCodeTextFieldWidget(),
                SizedBox(height: 43.h),
                AppResendOtp(),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.r),
                  child: AppButton(
                    text: 'Done',
                    onTap: () {
                      if (widget.isRegister == true) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SuccessMassage(
                              isRegister: widget.isRegister,
                            );
                          },
                        );
                      } else {
                        navigateTo(CreatePasswordView());
                      }
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
