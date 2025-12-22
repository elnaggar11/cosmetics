import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Search',
      borderRadius: 25.r,
      suffixIcon: AppImage(image: 'search.svg'),
    );
  }
}
