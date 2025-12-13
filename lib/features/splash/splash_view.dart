import 'package:cosmetics/core/utils/helper/navigate.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
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
    navigateTo(const OnboardingView(), delayInSeconds: 2, canPop: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(image: 'logo_icon.png', height: 200.h, width: 200.w),
            AppImage(
              image: 'splash_text.png',
              width: 120.w,
              height: 45.h,
              isCircle: false,
            ),
          ],
        ),
      ),
    );
  }
}
