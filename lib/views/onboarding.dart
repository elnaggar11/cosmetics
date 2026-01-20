import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';

import 'package:cosmetics/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (currentIndex != 2) _skipButton(),

            SizedBox(height: 80.h),

            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                children: [
                  _buildOnboarding(
                    image: 'assets/images/on_boarding1.png',
                    text: 'WELCOME !',
                    sub:
                        'Makeup has the power to transform your mood and empowers you to be a more confident person.',
                  ),
                  _buildOnboarding(
                    image: 'assets/images/on_boarding2.png',
                    text: 'SEARCH & PICK',
                    sub:
                        'We have dedicated set of products and routines hand picked for every skin type.',
                  ),
                  _buildOnboarding(
                    image: 'assets/images/notification.png',
                    text: 'PUCH NOTIFICATIONS ',
                    sub:
                        'Allow notifications for new makeup & cosmetics offers.',
                  ),
                ],
              ),
            ),

            SizedBox(
              child: currentIndex != 2
                  ? _buildButton(
                      onTap: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton(
                        color: Theme.of(context).colorScheme.secondary,
                        text: 'Get Started',
                        onTap: () {
                          navigateTo(const LoginView(), canPop: false);
                        },
                      ),
                    ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _skipButton() {
    return TextButton(
      onPressed: () {},
      child: Text('skip', style: Theme.of(context).textTheme.bodyMedium),
    );
  }

  Padding _buildOnboarding({
    required String image,
    required String text,
    required String sub,
  }) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset(image, height: 260.h, width: 280.w),
          SizedBox(height: 27.h),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'segoeui',
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            sub,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontFamily: 'segoeui',
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildButton({required void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset('assets/icons/arrow_forward.svg'),
        ),
      ),
    );
  }
}
