import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/cupertino.dart';
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
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'My Cart',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              color: Color(0xff434C6D),
                              fontVariations: [FontVariation('wght', 700)],
                            ),
                      ),
                    ),
                  ),
                  AppImage(image: 'my_cart.svg'),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                'You have 4 products in your cart',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Color(0x934C6D8C),
                  fontVariations: [FontVariation('wght', 400)],
                ),
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.r),
                      child: Column(children: [_Item()]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: AppImage(
                  image: 'mascara.png',
                  height: 102.h,
                  width: 102.h,
                ),
              ),
              SizedBox(width: 8.w),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Note Cosmetics\n',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff3B4569),
                        fontVariations: [FontVariation('wght', 700)],
                      ),
                    ),
                    TextSpan(
                      text: 'Ultra rich mascara for lashes\n \n',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff3B4569).withAlpha(75),
                        fontVariations: [FontVariation('wght', 500)],
                      ),
                    ),
                    TextSpan(
                      text: '350 EGP',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff3B4569),
                        fontVariations: [FontVariation('wght', 700)],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 11.w,
          top: 11.h,
          child: InkWell(
            onTap: () {},
            child: AppImage(
              image: 'delete_item.svg',
              height: 14.h,
              width: 11.w,
            ),
          ),
        ),
        Positioned(top: 60.h, right: 5.w, child: Counter()),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 120.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (counter > 1) {
                setState(() {
                  counter--;
                });
              }
            },
            child: Icon(CupertinoIcons.minus),
          ),
          Text(counter.toString(), style: TextStyle(fontSize: 16.sp)),
          GestureDetector(
            onTap: () {
              setState(() {
                counter++;
              });
            },
            child: Icon(CupertinoIcons.add),
          ),
        ],
      ),
    );
  }
}
