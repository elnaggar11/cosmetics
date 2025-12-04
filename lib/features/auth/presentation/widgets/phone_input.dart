import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
import 'package:cosmetics/features/auth/presentation/widgets/drop_down_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 70.w, height: 45.h, child: DropDownTextField()),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomTextField(
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
