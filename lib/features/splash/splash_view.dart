import 'package:cosmetics/core/utils/helper/navigate.dart';
import 'package:cosmetics/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateTo(const OnboardingView(), delayInSeconds: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_icon.png',
              width: 200.w,
              height: 200.h,
            ),
            Image.asset(
              'assets/images/splash_text.png',
              width: 120.w,
              height: 45.h,
            ),
          ],
        ),
      ),
    );
  }
}
