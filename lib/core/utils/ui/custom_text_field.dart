import 'package:cosmetics/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

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
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'montserrat',
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'montserrat',
        ),
        enabledBorder: outLineInputBorder(color: Colors.grey),
        focusedBorder: outLineInputBorder(color: AppColors.primaryColor),
        errorBorder: outLineInputBorder(color: Colors.red),
        focusedErrorBorder: outLineInputBorder(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
