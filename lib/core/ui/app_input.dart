import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_gender_selection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.label,
    this.withCountryCode = false,
    this.isPassword = false,
    this.textInputAction = TextInputAction.next,
    this.isGenderSelection = false,
    this.keyboardType = TextInputType.emailAddress,
    this.isInputContent = false,
    this.controller,
    this.onCountryCodeChanged,
  });
  final String? suffixIcon, hintText, label;
  final bool withCountryCode, isPassword, isGenderSelection, isInputContent;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Row(
        children: [
          if (widget.withCountryCode)
            AppCountryCode(onCountryCodeChanged: widget.onCountryCodeChanged),
          widget.isGenderSelection
              ? AppGenderSelection()
              : Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    obscureText: isHidden && widget.isPassword,
                    decoration: InputDecoration(
                      alignLabelWithHint: widget.isInputContent ? true : false,
                      contentPadding: widget.isInputContent
                          ? EdgeInsets.symmetric(
                              horizontal: 18.r,
                              vertical: 60.r,
                            )
                          : Theme.of(
                              context,
                            ).inputDecorationTheme.contentPadding,
                      labelText: widget.label,
                      hintText: widget.hintText,
                      suffixIcon: widget.isPassword
                          ? Padding(
                              padding: EdgeInsets.all(12.r),
                              child: AppImage(
                                image: 'password_view.json',
                                height: 24.h,
                                width: 24.w,
                                onLottieClicked: () {
                                  setState(() {
                                    isHidden = !isHidden;
                                  });
                                },
                              ),
                            )
                          : widget.suffixIcon != null
                          ? AppImage(
                              image: widget.suffixIcon!,
                              boxFit: BoxFit.scaleDown,
                            )
                          : null,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
