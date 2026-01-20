import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResendOtp extends StatefulWidget {
  const AppResendOtp({super.key});

  @override
  State<AppResendOtp> createState() => _AppResendOtpState();
}

class _AppResendOtpState extends State<AppResendOtp> {
  bool isSent = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Didn’t receive a code? '),
        TextButton(
          onPressed: () {
            isSent ? null : isSent = true;
            setState(() {});
          },
          child: Text(
            'Resend',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),

        Spacer(),
        if (isSent)
          CircularCountDownTimer(
            width: 50.w,
            height: 40.h,
            duration: 20,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent,
            onComplete: () {
              setState(() {
                isSent = false;
              });
            },
            textFormat: CountdownTextFormat.MM_SS,
          ),
      ],
    );
  }
}
