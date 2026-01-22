import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login_view.dart';

import 'package:cosmetics/views/onboarding.dart';
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
    navigateTo(
      CacheHelper.isFirstTime ? OnboardingView() : LoginView(),
      delayInSeconds: 2,
      canPop: false,
    );
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
