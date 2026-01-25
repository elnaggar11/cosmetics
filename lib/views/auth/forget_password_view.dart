import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';

import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/arrow_back_widget.dart';
import 'package:cosmetics/views/auth/verify_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final phonecontroller = TextEditingController();
  String? selectedCountryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ArrowBackWidget(),
                      SizedBox(width: 115.w),
                      Column(
                        children: [
                          SizedBox(height: 24.h),
                          AppImage(
                            image: 'logo_icon.png',
                            height: 62.h,
                            width: 67.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Forget Password',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Please enter your phone number below \n       to recovery your password.',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 45.h),
                  AppInput(
                    withCountryCode: true,
                    hintText: 'Phone Number',
                    onCountryCodeChanged: (value) {
                      selectedCountryCode = value;
                    },
                    controller: phonecontroller,
                  ),
                  SizedBox(height: 56.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 61.r),
                    child: AppButton(
                      text: 'Next',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          navigateTo(VerifyView(isRegister: false));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
