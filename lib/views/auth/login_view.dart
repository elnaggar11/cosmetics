import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/views/auth/forget_password_view.dart';
import 'package:cosmetics/views/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCountryCode;
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  AppImage(image: 'login.png'),
                  SizedBox(height: 20.h),
                  Text(
                    'Login Now',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'Please enter the details below to continue',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 25.h),
                  AppInput(
                    controller: phoneController,
                    withCountryCode: true,
                    hintText: 'Phone Number',
                    onCountryCodeChanged: (value) {
                      selectedCountryCode = value;
                    },
                    validator: InputValidator.phoneValidator,
                  ),
                  SizedBox(height: 7.h),
                  AppInput(
                    controller: passwordController,
                    isPassword: true,
                    hintText: 'Your password',
                    textInputAction: TextInputAction.done,
                    validator: InputValidator.passwordValidator,
                  ),

                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () {
                      navigateTo(ForgetPasswordView());
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20.0,
                    ),
                    child: AppButton(
                      text: 'Login',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final phone = phoneController.text.trim();
                          final password = passwordController.text.trim();
                        }
                        // navigateTo(HomeView(), canPop: false);
                      },
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(RegisterView());
                        },
                        child: Text(
                          'Register',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
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
