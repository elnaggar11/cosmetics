import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          return;
        }
      },
      child: Container(
        width: 30.h,
        height: 30.h,
        decoration: BoxDecoration(
          color: Color(0x1010100D),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(child: SvgPicture.asset('assets/icons/arrow_back.svg')),
      ),
    );
  }
}
