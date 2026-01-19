import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List _list = [
    _Model(imageName: 'bundles.png', title: 'Bundles'),
    _Model(imageName: 'perfumes.png', title: 'Perfumes'),
    _Model(imageName: 'makeup.png', title: 'Makeup'),
    _Model(imageName: 'skin_care.png', title: 'Skin Care'),
    _Model(imageName: 'gifts.png', title: 'Gifts'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D6D6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.r),
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Color(0xff434C6D),
                    fontVariations: [FontVariation('wght', 700)],
                  ),
                ),
              ),
              Search(),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.r),
                        child: Row(
                          children: [
                            AppImage(
                              image: _list[index].imageName,
                              height: 64.h,
                              width: 64.w,
                            ),
                            SizedBox(width: 25.w),
                            Text(
                              _list[index].title,
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    color: Color(0xff434C6D),
                                    fontVariations: [
                                      FontVariation('wght', 600),
                                    ],
                                  ),
                            ),

                            const Spacer(),
                            AppImage(image: 'arrow_right.svg'),
                          ],
                        ),
                      ),

                      if (index < _list.length - 1) Divider(),
                    ],
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

class _Model {
  final String imageName;
  final String title;

  _Model({required this.imageName, required this.title});
}
