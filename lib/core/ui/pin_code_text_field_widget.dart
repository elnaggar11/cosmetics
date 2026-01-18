import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTextFieldWidget extends StatelessWidget {
  const PinCodeTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      autoDismissKeyboard: true,
      animationType: AnimationType.slide,
      keyboardType: TextInputType.number,

      cursorColor: Colors.grey,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeFillColor: Colors.grey,
        selectedFillColor: Colors.grey,
        inactiveFillColor: Colors.grey,
        activeColor: Theme.of(context).colorScheme.secondary,
        selectedColor: Theme.of(context).colorScheme.secondary,
        inactiveColor: Colors.grey.shade300,
        fieldHeight: 45.h,
        fieldWidth: 45.w,
        borderRadius: BorderRadius.circular(8.r),
        borderWidth: 1.r,
      ),
    );
  }
}
