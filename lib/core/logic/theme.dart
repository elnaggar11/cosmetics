import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'montserrat',
    primaryColor: Color(0xff434C6D),
    secondaryHeaderColor: Color(0xffD75D72),
    scaffoldBackgroundColor: Color(0xffF5F5F5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xff434C6D),
      secondary: Color(0xffD75D72),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 16.sp),
    ),

    textTheme: TextTheme(
      /// biggest font in app
      headlineLarge: TextStyle(
        fontSize: 34.sp,
        fontVariations: [FontVariation('wght', 400)],
        color: Color(0xff284243),
      ),

      /// medium titles in app
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),

      /// small headline font style
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontVariations: [FontVariation('wght', 700)],
        color: Color(0xff434C6D),
      ),

      /// use with headline font
      bodyLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: Color(0xff284243),
      ),

      /// most useage font in app
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontVariations: [FontVariation('wght', 500)],
        color: Color(0xff434C6D),
      ),

      /// help titles font
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontVariations: [FontVariation('wght', 500)],
        color: Color(0xff434C6D),
      ),

      /// With text button
      labelLarge: TextStyle(
        fontSize: 18.sp,
        fontVariations: [FontVariation('wght', 500)],
        color: Colors.black,
      ),

      /// lable up the button
      labelMedium: TextStyle(),

      /// the most small font style
      labelSmall: TextStyle(
        fontSize: 14.sp,
        fontVariations: [FontVariation('wght', 400)],
        color: Color(0xFF8E8EA9),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,

        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'segoeui',
        ),
        backgroundColor: Color(0xffD75D72),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.r),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Color(0xff284243),
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontVariations: [FontVariation('wght', 700)],
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 12.r),
      suffixIconColor: const Color(0xff8E8EA9),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        color: Color(0xff434C6D),
        fontVariations: [FontVariation('wght', 600)],
      ),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: Color(0xff434C6D),
        fontVariations: [FontVariation('wght', 400)],
      ),
      border: outLineInputBorder(color: Colors.white),
      enabledBorder: outLineInputBorder(
        color: Color(0xff669066).withAlpha(120),
      ),
      focusedBorder: outLineInputBorder(color: Color(0xffD75D72)),
      errorBorder: outLineInputBorder(color: Colors.red),
      focusedErrorBorder: outLineInputBorder(color: Colors.red),
      errorStyle: const TextStyle(height: .1, fontSize: 12),
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
