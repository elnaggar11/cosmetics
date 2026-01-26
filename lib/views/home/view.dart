import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/categories.dart';
import 'package:cosmetics/views/home/pages/home/view.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List _list = [
    _Model(icon: 'nav_bar_home.svg', page: HomePage()),
    _Model(icon: 'nav_bar_categories.svg', page: CategoriesPage()),
    _Model(icon: 'nav_bar_cart.svg', page: CartPage()),
    _Model(icon: 'nav_bar_profile.svg', page: ProfilePage()),
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
                color: currentIndex == index
                    ? Theme.of(context).colorScheme.secondary
                    : null,
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
