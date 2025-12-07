import 'package:cosmetics/features/auth/presentation/widgets/verify_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCreateAccount extends StatelessWidget {
  const VerifyCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: SingleChildScrollView(child: VerifyWidgets()),
        ),
      ),
    );
  }
}
