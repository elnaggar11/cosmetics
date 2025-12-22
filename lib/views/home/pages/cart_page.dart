import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D6D6),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  const Spacer(),
                  AppImage(image: 'my_cart.svg'),
                ],
              ),
              SizedBox(height: 24.h),

              Text(
                'You have 4 products in your cart',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0x934C6D8C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
