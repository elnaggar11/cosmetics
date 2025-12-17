import 'dart:async';

import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/core/utils/ui/pin_code_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  int secondsLeft = 60;
  Timer? _timer;

  void timer() {
    _timer?.cancel();
    setState(() {
      secondsLeft = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    fontFamily: 'montserrat',
                  ),
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
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const PinCodeTextFieldWidget(),
                SizedBox(height: 43.h),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Didn’t receive a code? ',
                        children: [
                          TextSpan(
                            text: 'Resend',
                            style: TextStyle(color: AppColors.primaryColor),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text('00.30'),
                  ],
                ),
                SizedBox(height: 113.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.r),
                  child: AppButton(text: 'Done', onTap: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
