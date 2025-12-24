import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List _list = [
    _Model(image: 'edit_info.svg', text: 'Edit Info'),
    _Model(image: 'order_history.svg', text: 'Order History'),
    _Model(image: 'wallet.svg', text: 'Wallet'),
    _Model(image: 'setting.svg', text: 'Setting'),
    _Model(image: 'voucher.svg', text: 'Voucher'),
    _Model(image: 'logout.svg', text: 'Log out'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2D2D2),
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: Stack(
              children: [
                Container(
                  height: 152.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                      colors: [Color(0x434C6DD4), Color(0xffECA4C5)],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: AppImage(image: 'girl.png', height: 96.h, width: 96.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'sara',
            style: TextStyle(
              color: Color(0xff434C6D),
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 16.r,
            ),
          ),
          SizedBox(height: 40.h),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 13.h),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 34.h),
                  child: _Item(
                    index: index,
                    image: _list[index].image,
                    title: _list[index].text,
                    color: index == _list.length - 1
                        ? Color(0xffCD0F0F)
                        : Color(0xff434C6D),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final int index;

  const _Item({
    required this.color,
    required this.image,
    required this.title,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(image: image),
        SizedBox(width: 4.w),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 14.r,
          ),
        ),
        Spacer(),
        AppImage(image: index == 5 ? '' : 'arrow_right.svg'),
      ],
    );
  }
}

class _Model {
  final String image;
  final String text;

  _Model({required this.image, required this.text});
}
