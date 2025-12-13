import 'dart:async';

import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/app_button.dart';
import 'package:cosmetics/features/auth/presentation/widgets/verify_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCreateAccount extends StatefulWidget {
  const VerifyCreateAccount({super.key});

  @override
  State<VerifyCreateAccount> createState() => _VerifyCreateAccountState();
}

class _VerifyCreateAccountState extends State<VerifyCreateAccount> {
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
                VerifyWidgets(),
                SizedBox(height: 43),
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
