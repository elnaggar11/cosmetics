import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
import 'package:cosmetics/features/auth/presentation/widgets/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPasswordVisible = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              Text(
                'Login Now',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                  fontFamily: 'montserrat',
                ),
              ),
              Text(
                'Please enter the details below to continue',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontFamily: 'montserrat',
                ),
              ),
              PhoneInput(),
              SizedBox(height: 20.h),
              CustomTextField(
                hintText: 'Your Password',
                obscureText: _isPasswordVisible,
                suffixIcon: GestureDetector(
                  onTap: () {
                    _controller.duration = const Duration(milliseconds: 500);
                    if (_controller.isCompleted) {
                      setState(() {
                        _controller.reverse();
                        _isPasswordVisible = true;
                      });
                    } else {
                      _controller.forward();
                      setState(() {
                        _isPasswordVisible = false;
                      });
                    }
                  },
                  child: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Lottie.asset(
                        'assets/lotties/password_view.json',

                        controller: _controller,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
