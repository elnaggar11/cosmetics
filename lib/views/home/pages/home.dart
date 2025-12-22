import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2D2D2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Search(),
                SizedBox(height: 14.h),
                Container(
                  width: 364.w,
                  height: 320.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/offer_background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentGeometry.center,
                    child: Container(
                      width: 364.w,
                      height: 150.w,
                      decoration: BoxDecoration(color: Color(0xccE9DCD3)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.r),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text.rich(
                                  style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff62322D),
                                  ),
                                  TextSpan(
                                    children: [
                                      TextSpan(text: '50% OFF DISCOUNT\n'),
                                      TextSpan(text: 'CUPON CODE : 125865'),
                                    ],
                                  ),
                                ),
                                AppImage(image: 'offer.svg'),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AppImage(image: 'offer.svg'),
                                Text.rich(
                                  style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff434C6D),
                                  ),
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Hurry up!\n'),
                                      TextSpan(text: 'Skin care only !'),
                                    ],
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
                SizedBox(height: 26.h),
                Text(
                  'Top rated products',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 16.r,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 14.h),
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.h,
                    childAspectRatio: 176.w / 237.h,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xffD2D2D2),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 161.w,
                            height: 169.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/first_product.png',
                                ),
                              ),
                            ),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: AppImage(image: 'add_to_cart.svg'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
