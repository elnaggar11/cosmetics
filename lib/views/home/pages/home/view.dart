import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'components/offers.dart';
part 'components/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D6D6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Search(),
              SizedBox(height: 14.h),
              _Offers(),
              SizedBox(height: 26.h),
              _List(),
            ],
          ),
        ),
      ),
    );
  }
}
