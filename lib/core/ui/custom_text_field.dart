import 'package:cosmetics/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.borderRadius = 8,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'montserrat',
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'montserrat',
        ),
        enabledBorder: outLineInputBorder(
          color: Colors.grey,
          borderRadius: borderRadius,
        ),
        focusedBorder: outLineInputBorder(
          color: AppColors.primaryColor,
          borderRadius: borderRadius,
        ),
        errorBorder: outLineInputBorder(
          color: Colors.red,
          borderRadius: borderRadius,
        ),
        focusedErrorBorder: outLineInputBorder(
          color: Colors.red,
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder({
    required Color color,
    double borderRadius = 8,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color),
    );
  }
}
