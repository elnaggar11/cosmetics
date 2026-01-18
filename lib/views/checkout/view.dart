import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D6D6),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.r, vertical: 20.r),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC3D5D6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Delivery to',
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 18.h),
                    _Item(
                      leadingImage: 'map.png',
                      trailingImage: 'down_arrow.svg',
                      title: 'Home',
                      subTitle: 'Mansoura, 14 Porsaid St',
                      isDropDown: true,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 18.h),
                    _Item(
                      leadingImage: 'meza.svg',
                      trailingImage: 'down_arrow.svg',
                      title: '************0235',
                      isDropDown: true,
                    ),

                    SizedBox(height: 12.h),
                    _Item(
                      leadingImage: 'discount.svg',
                      trailingImage: 'down_arrow.svg',
                      title: 'Add vaucher',
                      isDropDown: false,
                    ),
                    Text(
                      '_  ' * 100,
                      maxLines: 1,
                      style: TextStyle(color: Color(0x434C6D4F)),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '- REVIEW PAYMENT',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      'PAYMENT SUMMARY',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const _Texts(title: 'Subtotal', subTitle: '16.100 EGP'),
                    const _Texts(
                      title: 'SHIPPING FEES',
                      subTitle: 'TO BE CALCULATED',
                    ),
                    SizedBox(height: 20.h),

                    const Divider(thickness: 1, color: Color(0xff73B9BB)),

                    SizedBox(height: 10.h),
                    const _Texts(title: 'TOTAL + VAT', subTitle: '16.100 EGP'),
                    SizedBox(height: 20.h),
                    AppButton(text: 'ORDER', image: 'order.svg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String leadingImage, trailingImage, title, subTitle;
  final bool isDropDown;
  const _Item({
    required this.leadingImage,
    required this.trailingImage,
    required this.title,
    this.subTitle = '',
    this.isDropDown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff73B9BB)),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: ListTile(
        leading: AppImage(image: leadingImage),
        title: Text(title),
        subtitle: subTitle.isEmpty ? null : Text(subTitle),
        trailing: !isDropDown
            ? SizedBox(
                width: 77.w,
                height: 33.h,
                child: AppButton(
                  text: "apply",
                  fontSize: 12.sp,
                  verticalPadding: 0,
                ),
              )
            : AppImage(image: 'down_arrow.svg'),
      ),
    );
  }
}

class _Texts extends StatelessWidget {
  const _Texts({required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        Text(
          subTitle,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
