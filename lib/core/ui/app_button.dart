import 'package:cosmetics/core/constants/app_colors.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text = '',
    this.onTap,
    this.color = AppColors.primaryColor,
    this.fontSize = 16,
    this.image,
    this.verticalPadding = 20,
  });
  final String text;
  final void Function()? onTap;
  final Color? color;
  final double fontSize;
  final String? image;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      ),
      onPressed: onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(image: image ?? ''),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: fontSize.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
