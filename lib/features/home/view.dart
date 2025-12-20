import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:cosmetics/core/utils/ui/app_image.dart';
import 'package:cosmetics/features/home/views/cart.dart';
import 'package:cosmetics/features/home/views/categories.dart';
import 'package:cosmetics/features/home/views/home.dart';
import 'package:cosmetics/features/home/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List _list = [
    _Model(icon: 'nav_bar_home.svg', page: Home()),
    _Model(icon: 'nav_bar_categories.svg', page: Categories()),
    _Model(icon: 'nav_bar_cart.svg', page: Cart()),
    _Model(icon: 'nav_bar_profile.svg', page: Profile()),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[currentIndex].page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 64.h,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 13.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          color: Color(0xffD9D9D9),
          boxShadow: [
            BoxShadow(
              offset: Offset(8, 4),
              blurRadius: 6,
              color: Colors.black.withValues(alpha: 0.12),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          items: List.generate(
            _list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                image: _list[index].icon,
                color: currentIndex == index ? AppColors.primaryColor : null,
              ),
              label: '',
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;
  final Widget page;

  _Model({required this.icon, required this.page});
}
