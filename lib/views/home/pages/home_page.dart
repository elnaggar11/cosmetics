import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Color(0xff62322D),
                                      fontVariations: [
                                        FontVariation('wght', 700),
                                      ],
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
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Color(0xff434C6D),
                                      fontVariations: [
                                        FontVariation('wght', 700),
                                      ],
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Color(0xff434C6D),
                  fontVariations: [FontVariation('wght', 700)],
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
                  childAspectRatio: 180.w / 240.h,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xffD2D2D2),
                    elevation: 6,
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              AppImage(image: 'first_product.png'),
                              Positioned(
                                right: 6.h,
                                top: 6.h,
                                child: InkWell(
                                  child: Container(
                                    height: 32.w,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: AppImage(image: 'add_to_cart.svg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 11.h),
                          Text(
                            'Face tint / lip tint',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: Color(0xff434C6D),
                                  fontVariations: [FontVariation('wght', 600)],
                                ),
                          ),

                          SizedBox(height: 11.h),

                          Text(
                            '\$44.99',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: Color(0xff70839C),
                                  fontVariations: [FontVariation('wght', 700)],
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
